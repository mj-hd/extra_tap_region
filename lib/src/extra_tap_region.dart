import 'package:defer_pointer/defer_pointer.dart';
import 'package:extra_tap_region/src/isolate_pointer.dart';
import 'package:flutter/material.dart';

/// A widget to put extra tap region around the child widget
class ExtraTapRegion extends StatelessWidget {
  const ExtraTapRegion({
    Key? key,
    this.margin = 8.0,
    required this.onPressed,
    this.onLongPress,
    required this.child,
  }) : super(key: key);

  final double margin;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -1 * margin,
          left: -1 * margin,
          right: -1 * margin,
          bottom: -1 * margin,
          child: DeferPointer(
            child: IsolatePointer(
              child: GestureDetector(
                onTap: onPressed,
                onLongPress: onLongPress,
                excludeFromSemantics: true,
                behavior: HitTestBehavior.opaque,
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}

class ExtraTapRegionContainer extends StatelessWidget {
  const ExtraTapRegionContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DeferredPointerHandler(child: child);
  }
}
