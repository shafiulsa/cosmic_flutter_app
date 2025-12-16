import 'package:e_commerce_app/Common/widgets/loaders/circular_loader.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/Data/repository/address/address_repository.dart';
import 'package:e_commerce_app/features/personalization/models/address_model.dart';
import 'package:e_commerce_app/features/personalization/view/address/widgets/single_address.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// Variables
  final _repository = Get.put(AddressRepository());

  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  RxBool refreshDate = false.obs;

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();

  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  /// [Upload] - function to store user address
  Future<void> addNewAddress() async {
    try {
      // start loading
      SFullScreenLoader.openLoadingDialog('Storing Address...');

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //stop Loading
        SFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      // Create Address Model
      AddressModel address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        postalCode: postalCode.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        country: country.text.trim(),
        dateTime: DateTime.now(),
      ); // AddressModel

      /// Save addres
      String addressId = await _repository.addAddress(address);

      //update addres id
      address.id = addressId;
      //update selected address
      selectedAddress(address);
      //stop Loading
      SFullScreenLoader.stopLoading();

      // show success message
      Future.delayed(Duration(milliseconds: 300), () {
        SSnackBarHelpers.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been save successfully',
        );

        //Refresh address data
        refreshDate.toggle();

        // reset field
        resetFormFields();

        // go back
        Navigator.pop(Get.context!);
        // Navigator.pop(Get.context!);
      });
    } catch (e) {
      // // Stop Loading
      SFullScreenLoader.stopLoading();
      SSnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
  }

  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try {
      // startLoading
      Get.defaultDialog(
        title: '',
        onWillPop: () async => false,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: SCircularLoader(),
      );
      // un-select the already selected address
      if (selectedAddress.value.id.isNotEmpty) {
        await _repository.updateSelectedField(selectedAddress.value.id, false);
      }

      // assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the Selected Address to true in the firebase
      await _repository.updateSelectedField(selectedAddress.value.id, true);

      // Go Back
      Get.back();
    } catch (e) {
      Get.back();
      SSnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
  }

  /// [Fetch] - function to fetch user address
  Future<List<AddressModel>> getAllAddress() async {
    try {
      List<AddressModel> address = await _repository.fetchUserAddress();
      selectedAddress.value = address.firstWhere(
        (address) => address.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return address;
    } catch (e) {
      SSnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
      return [];
    }
  }


  Future<void> selectNewAddressBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(SSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SSectionHeading(title: 'Select Address', showActionButton: false),
              SizedBox(height: SSizes.spaceBtwItems),
              FutureBuilder(
                future: getAllAddress(),
                builder: (context, snapshot) {
                  final widget = SCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if (widget != null) return widget;

                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: SSizes.spaceBtwItems),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => SSingleAddress(
                      address: snapshot.data![index],
                      onTap: () {
                        selectedAddress(snapshot.data![index]);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState!.reset();
  }
}
