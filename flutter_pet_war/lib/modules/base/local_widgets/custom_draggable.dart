import 'package:flutter/material.dart';

class CustomDraggable<T extends Object> extends StatelessWidget {
  final Widget child;
  final Widget feedback;
  final Widget? childWhenDragging;
  final T? data;
  //
  final void Function()? onDragStarted;
  final void Function(DragUpdateDetails)? onDragUpdate;
  final void Function(Velocity, Offset)? onDraggableCanceled;
  final void Function(DraggableDetails)? onDragEnd;
  final void Function()? onDragCompleted;

  const CustomDraggable({
    super.key,
    required this.child,
    required this.feedback,
    this.data,
    this.childWhenDragging,
    this.onDragStarted,
    this.onDragUpdate,
    this.onDraggableCanceled,
    this.onDragEnd,
    this.onDragCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<T>(
      data: data,
      feedback: feedback,
      childWhenDragging: childWhenDragging ?? Container(),
      onDragStarted: onDragStarted,
      onDragCompleted: onDragCompleted,
      onDraggableCanceled: onDraggableCanceled,
      onDragUpdate: onDragUpdate,
      onDragEnd: onDragEnd,
      child: child,
    );
  }
}
