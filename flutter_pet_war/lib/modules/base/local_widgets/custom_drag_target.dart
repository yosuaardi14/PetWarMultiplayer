import 'package:flutter/material.dart';

class CustomDragTarget<T extends Object> extends StatelessWidget {
  final Widget child;
  final Widget emptyChild;
  final bool showCondition;
  final bool Function(DragTargetDetails<T>)? onWillAcceptWithDetails;
  final void Function(DragTargetDetails<T>)? onAcceptWithDetails;
  final void Function(T?)? onLeave;
  final void Function(DragTargetDetails<T>)? onMove;
  final Widget Function(BuildContext, List<T?>, List<dynamic>)? builder;

  const CustomDragTarget({
    super.key,
    required this.child,
    this.showCondition = false,
    this.onWillAcceptWithDetails,
    this.onAcceptWithDetails,
    this.onLeave,
    this.onMove,
    required this.emptyChild,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<T>(
      onWillAcceptWithDetails: onWillAcceptWithDetails ??
          (details) {
            return true;
          },
      onAcceptWithDetails: onAcceptWithDetails,
      onLeave: onLeave,
      onMove: onMove,
      builder: builder ??
          (context, candidateData, rejectedData) {
            if (showCondition) {
              return child;
            }
            return emptyChild;
          },
    );
  }
}
