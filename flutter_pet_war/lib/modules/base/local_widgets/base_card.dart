import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/custom_drag_target.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/custom_draggable.dart';

class BaseCard<T extends Object> extends StatelessWidget {
  // final String cardType;
  final WidgetMode type;
  //
  final T? data;
  final Widget child;
  //
  final Widget? feedback;
  final Widget? childWhenDragging;
  final void Function()? onDragStarted;
  final void Function(DragUpdateDetails)? onDragUpdate;
  final void Function(Velocity, Offset)? onDraggableCanceled;
  final void Function(DraggableDetails)? onDragEnd;
  final void Function()? onDragCompleted;
  //
  final bool showCondition;
  final Widget emptyChild;
  final bool Function(DragTargetDetails<T>)? onWillAcceptWithDetails;
  final void Function(DragTargetDetails<T>)? onAcceptWithDetails;
  final void Function(T?)? onLeave;
  final void Function(DragTargetDetails<T>)? onMove;
  final Widget Function(BuildContext, List<T?>, List<dynamic>)? builder;

  const BaseCard({
    super.key,
    // required this.cardType,
    this.type = WidgetMode.normal,
    this.data,
    required this.child,
    this.feedback,
    this.childWhenDragging,
    this.onDragStarted,
    this.onDragUpdate,
    this.onDraggableCanceled,
    this.onDragEnd,
    this.onDragCompleted,
    this.showCondition = false,
    required this.emptyChild,
    this.onWillAcceptWithDetails,
    this.onAcceptWithDetails,
    this.onLeave,
    this.onMove,
    this.builder,
  });

  Widget showTargetBorder({required Widget child}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Opacity(
          opacity: 0.8,
          child: Container(
            color: Colors.grey,
            width: Constant.CARD_WIDTH + 5,
            height: Constant.CARD_HEIGHT,
          ),
        ),
        const Icon(Icons.arrow_downward, size: 75, color: Colors.white),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (type == WidgetMode.draggable) {
      return CustomDraggable<T>(
        data: data,
        feedback: feedback ?? child,
        childWhenDragging: childWhenDragging,
        onDragStarted: onDragStarted,
        onDragCompleted: onDragCompleted,
        onDraggableCanceled: onDraggableCanceled,
        onDragUpdate: onDragUpdate,
        onDragEnd: onDragEnd,
        child: child,
      );
    } else if (type == WidgetMode.dragTarget) {
      return CustomDragTarget<T>(
        showCondition: showCondition,
        onAcceptWithDetails: onAcceptWithDetails,
        onWillAcceptWithDetails: onWillAcceptWithDetails,
        onLeave: onLeave,
        onMove: onMove,
        builder: builder,
        emptyChild: showTargetBorder(child: emptyChild),
        child: showTargetBorder(child: child),
      );
    }
    return child;
  }
}
