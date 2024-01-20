import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/device/device_utility.dart';

class WHRatingProgressIndicator extends StatelessWidget {
  const WHRatingProgressIndicator({
    super.key, 
    required this.text, 
    required this.value,
  });

  final String text;
  final double value;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: WatchHubDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: WatchHubColors.grey,
              valueColor: const AlwaysStoppedAnimation(WatchHubColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}