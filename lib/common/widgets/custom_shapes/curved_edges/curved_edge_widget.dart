import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class WHCurvedEdgeWidget extends StatelessWidget {
  const WHCurvedEdgeWidget({
    super.key,
    this.child
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WHCustomCurvedEdges(),
      child: child
    );
  }
}