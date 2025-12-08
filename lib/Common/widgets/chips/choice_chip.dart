import 'package:e_commerce_app/Common/widgets/custome_shape/circular_container.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SChoiceChip extends StatelessWidget {
  const SChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelected,
    this.selectedColor,
  });

  final String text;
  final bool selected;
  final Function(bool)? onSelected;
  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    // ai shape dhorai jodi colore pay tobe circuler hobe ar jodi collor na pay tobe rectanguler hobe

    bool isColor =SHelperFunction.getColor(text) !=null;
    return ChoiceChip(
      label: isColor ? SizedBox() :Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? SColors.white : null),
      selectedColor: selectedColor,
      shape: isColor? CircleBorder() : null,

      labelPadding: isColor ? EdgeInsets.zero : null,
      padding: isColor?EdgeInsets.zero : null,
      avatar: isColor ? SCircularContainer(width: 50.0, height: 50.0, backgroundColor: SHelperFunction.getColor(text)!) : null,

      backgroundColor: isColor?SHelperFunction.getColor(text) :null,
    );
  }
}
