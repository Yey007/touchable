import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';
import 'package:touchable/src/types/types.dart';

class Rectangle extends Shape {
  final Rect rect;

  Rectangle(this.rect,
      {Map<GestureType, Function>? gestureMap,
      Paint? paint,
      HitTestBehavior? hitTestBehavior,
      StrokeHitBehavior? strokeHitBehavior,
      PaintingStyle? paintStyleForTouch})
      : super(
            hitTestBehavior: hitTestBehavior,
            strokeHitBehavior: strokeHitBehavior,
            paint: paint ?? Paint(),
            gestureCallbackMap: gestureMap ?? {});

  @override
  bool isInside(Offset p) {
    if (paint.style == PaintingStyle.fill) {
      return rect.contains(p);
    } else {
      double extraWidth = paint.strokeWidth / 2;

      bool insideOuterRect = Rect.fromLTRB(
              rect.left - extraWidth,
              rect.top - extraWidth,
              rect.right + extraWidth,
              rect.bottom + extraWidth)
          .contains(p);

      bool outsideInnerRect = !Rect.fromLTRB(
              rect.left + extraWidth,
              rect.top + extraWidth,
              rect.right - extraWidth,
              rect.bottom - extraWidth)
          .contains(p);

      if (strokeHitBehavior == StrokeHitBehavior.withinBounds) {
        return insideOuterRect;
      }

      return insideOuterRect && outsideInnerRect;
    }
  }
}
