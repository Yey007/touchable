import 'dart:async';
import 'package:flutter/material.dart';
import 'package:touchable/src/types/types.dart';

/// Created by nateshmbhat on 04,April,2020

class CanvasTouchDetector extends StatefulWidget {
  final CustomTouchPaintBuilder builder;
  const CanvasTouchDetector({Key key, this.builder}) : super(key: key);

  @override
  _CanvasTouchDetectorState createState() => _CanvasTouchDetectorState();
}

class _CanvasTouchDetectorState extends State<CanvasTouchDetector> {
  final StreamController<Gesture> touchController = StreamController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (tapDetail) {
          touchController.add(Gesture( GestureType.onTapDown, tapDetail));
        },
        onTapUp: (tapDetail) {
          touchController.add(Gesture( GestureType.onTapUp, tapDetail));
        },
//        onHorizontalDragDown: (tapDetail) {
//          touchController.add(Gesture( GestureType.onHorizontalDragDown, tapDetail));
//        },
//        onHorizontalDragStart: (tapDetail) {
//          touchController.add(Gesture( GestureType.onHorizontalDragStart, tapDetail));
//        },
//        onHorizontalDragUpdate: (tapDetail) {
//          touchController.add(Gesture( GestureType.onHorizontalDragUpdate, tapDetail));
//        },
//        onVerticalDragDown: (tapDetail) {
//          touchController.add(Gesture( GestureType.onVerticalDragDown, tapDetail));
//        },
//        onVerticalDragStart: (tapDetail) {
//          touchController.add(Gesture( GestureType.onVerticalDragStart, tapDetail));
//        },
//        onVerticalDragUpdate: (tapDetail) {
//          touchController.add(Gesture( GestureType.onVerticalDragUpdate, tapDetail));
//        },
        onLongPressStart: (tapDetail) {
          touchController
              .add(Gesture( GestureType.onLongPressStart, tapDetail));
        },
        onLongPressEnd: (tapDetail) {
          touchController.add(Gesture( GestureType.onLongPressEnd, tapDetail));
        },
        onLongPressMoveUpdate: (tapDetail) {
          touchController
              .add(Gesture( GestureType.onLongPressMoveUpdate, tapDetail));
        },
//        onScaleStart: (tapDetail) {
//          touchController.add(Gesture( GestureType.onScaleStart, tapDetail));
//        },
//        onScaleUpdate: (tapDetail) {
//          touchController.add(Gesture( GestureType.onScaleUpdate, tapDetail));
//        },
        onForcePressStart: (tapDetail) {
          touchController
              .add(Gesture( GestureType.onForcePressStart, tapDetail));
        },
        onForcePressEnd: (tapDetail) {
          touchController.add(Gesture( GestureType.onForcePressEnd, tapDetail));
        },
        onForcePressPeak: (tapDetail) {
          touchController
              .add(Gesture( GestureType.onForcePressPeak, tapDetail));
        },
        onForcePressUpdate: (tapDetail) {
          touchController
              .add(Gesture( GestureType.onForcePressUpdate, tapDetail));
        },
        onPanStart: (tapDetail) {
          touchController.add(Gesture( GestureType.onPanStart, tapDetail));
        },
        onPanUpdate: (tapDetail) {
          touchController.add(Gesture( GestureType.onPanUpdate, tapDetail));
        },
        onPanDown: (tapDetail) {
          touchController.add(Gesture( GestureType.onPanDown, tapDetail));
        },
        onSecondaryTapDown: (tapDetail) {
          touchController.add(Gesture( GestureType.onSecondaryTapDown, tapDetail));
        },
        onSecondaryTapUp: (tapDetail) {
          touchController.add(Gesture( GestureType.onSecondaryTapUp, tapDetail));
        },
        child: widget.builder(context, touchController));
  }

  @override
  void dispose() {
    touchController.close();
    super.dispose();
  }
}
