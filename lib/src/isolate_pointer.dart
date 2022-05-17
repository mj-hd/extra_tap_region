import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A widget to isolate its subtree from parent's hitTest propagation
class IsolatePointer extends SingleChildRenderObjectWidget {
  const IsolatePointer({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _IsolatePointerRenderObject();
}

class _IsolatePointerRenderObject extends RenderProxyBox {
  _IsolatePointerRenderObject({
    RenderBox? child,
  }) : super(child);

  @override
  void debugPaint(PaintingContext context, Offset offset) {
    assert(() {
      if (!debugPaintSizeEnabled) return true;

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.orange.withAlpha(100);

      context.canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height).shift(offset),
        paint,
      );

      return true;
    }());
  }

  @override
  bool hitTest(
    BoxHitTestResult result, {
    required Offset position,
  }) {
    if (!size.contains(position)) return false;

    hitTestChildren(result, position: position);

    return false;
  }
}
