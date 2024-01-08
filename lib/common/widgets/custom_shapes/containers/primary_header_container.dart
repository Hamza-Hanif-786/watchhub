import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:watchhub/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:watchhub/utils/constants/colors.dart';

class WHPrimaryHeaderContainer extends StatelessWidget {
  const WHPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WHCurvedEdgeWidget(
      child: Container(
        color: WatchHubColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(top: -150, right: -250, child: WHCircularContainer(backgroundColor: WatchHubColors.textWhite.withOpacity(0.1))),
              Positioned(top: 100, right: -300, child: WHCircularContainer(backgroundColor: WatchHubColors.textWhite.withOpacity(0.1))),
              child
            ],
          ),
        ),
      ),
    );
  }
}
