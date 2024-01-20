import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHChoiceChip extends StatelessWidget {
  const WHChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = WatchHubHelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text), 
        selected: selected, 
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? WatchHubColors.white : null),
        avatar: isColor ? WHCircularContainer(width: 50, height: 50, backgroundColor: WatchHubHelperFunctions.getColor(text)!) : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,    
        backgroundColor: isColor ? WatchHubHelperFunctions.getColor(text)! : null 
      ),
    );
  }
}