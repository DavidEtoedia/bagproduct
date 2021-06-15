import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class _ScrollControllerForFloatingNav extends Hook<ScrollController> {
  final AnimationController animationController;
  const _ScrollControllerForFloatingNav({
    @required this.animationController,
  });

  @override
  _ScrollControllerForFloatingNavState createState() =>
      _ScrollControllerForFloatingNavState();
}

class _ScrollControllerForFloatingNavState
    extends HookState<ScrollController, _ScrollControllerForFloatingNav> {
  ScrollController _scrollController = ScrollController();

  @override
  void initHook() {
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          hook.animationController.forward();

          break;

        case ScrollDirection.reverse:
          hook.animationController.reverse();

          break;

        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  void dispose() => _scrollController.dispose();

  @override
  ScrollController build(BuildContext context) => _scrollController;
}

//the final implementation

ScrollController useControllerForAnimation(
  AnimationController animationController,
) {
  return use(_ScrollControllerForFloatingNav(
      animationController: animationController));
}
