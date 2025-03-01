import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/touchable.dart';

abstract class Shape {
  final Paint paint;
  final Map<GestureType, Function> gestureCallbackMap;
  final HitTestBehavior hitTestBehavior;
  final StrokeHitBehavior strokeHitBehavior;

  Set<GestureType> get registeredGestures => gestureCallbackMap.keys.toSet();

  Shape({
    Paint? paint,
    Map<GestureType, Function>? gestureCallbackMap,
    HitTestBehavior? hitTestBehavior,
    StrokeHitBehavior? strokeHitBehavior,
  })  : paint = paint ??
            (Paint()
              ..strokeWidth = ShapeConstant.floatPrecision
              ..style = PaintingStyle.fill),
        gestureCallbackMap = gestureCallbackMap ?? {},
        hitTestBehavior = hitTestBehavior ?? HitTestBehavior.opaque,
        strokeHitBehavior = strokeHitBehavior ?? StrokeHitBehavior.onlyOnPaint {
    if (this.paint.strokeWidth == 0) {
      this.paint.strokeWidth = ShapeConstant.floatPrecision;
    }
  }

  bool isInside(Offset p);

  Function getCallbackFromGesture(Gesture gesture) {
    if (gestureCallbackMap.containsKey(gesture.gestureType)) {
      return () =>
          gestureCallbackMap[gesture.gestureType]?.call(gesture.gestureDetail);
    } else {
      return () {};
    }
  }
}
