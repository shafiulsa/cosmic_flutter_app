import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Common/widgets/products/favourite/favourite_icon.dart';
import 'package:e_commerce_app/features/shop/controllers/product/image_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Common/widgets/appbar/appbar.dart';
import '../../../../../Common/widgets/images/roundes_image.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SProductThumnailAndSlider extends StatelessWidget {
  const SProductThumnailAndSlider({
    super.key, required this.product,

  });

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    final controller =Get.put(ImageController());
  List<String>  images = controller.getAllProductImages(product);
    return Container(
      color: dark ? SColors.darkGrey : SColors.light,
      child: Stack(
        children: [
          /// [Image] - Thumbnail
          SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(SSizes.productImageRadius * 2),
              child: Center(
                child: Obx(
                    (){

                      final image=controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: ()=>controller.showEnlargeImage(image),
                        child: CachedNetworkImage(
                            imageUrl: image,
                            progressIndicatorBuilder:(context,url,progress)=>CircularProgressIndicator(color: SColors.primary,value: progress.progress)
                        ),
                      );
                    }
                ),
              ),
            ), // Padding, SizedBox
          ),

          /// Image Slider
          Positioned(
            left: SSizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80.0,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: SSizes.spaceBtwItems),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) => Obx(
                    (){
   bool isImageSelected =controller.selectedProductImage.value ==images[index];
                      return SRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        onTap: ()=> controller.selectedProductImage.value =images[index],
                        backgroundColor: dark ? SColors.dark : SColors.white,
                        padding: EdgeInsets.all(SSizes.sm),
                        border: Border.all(color: isImageSelected ?SColors.primary: Colors.transparent),
                        imageUrl: images[index],
                      );
                    }
                ),
              ), // SRoundedImage, ListView.builder
            ),
          ), // / SizedBox


          // [Appbar]  back arrow and favourit icon
          SAppBarr(
            showBackArrow: true,
            // actions: [
            //   SCircularIcon(icon: SFavouriteIcon(productId: product.id), color: Colors.red),
            // ],
            actions: [
              SFavouriteIcon(productId: product.id),
            ],

          ),
        ],
      ),
    );
  }
}
