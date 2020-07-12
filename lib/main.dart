import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: LogoApp(),
  );
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

//Animationオブジェクトを定義するクラス
class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this)
      ..addStatusListener(_onAnimationStatusChanged);
    controller.forward();
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        controller.reverse();
        break;
      case AnimationStatus.dismissed:
        controller.forward();
        break;
      default:
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GrowTransition(
    child: LogoWidget(),
  );
}

//アニメーションを描画するクラス
class GrowTransition extends StatelessWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  GrowTransition({ Key key, this.child, this.animation })
      : assert(child != null),
        assert(animation != null),
        super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) => Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: child,
          ),
        ),
      ),
    ),
  );
}

//ロゴを描画するクラス
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: FlutterLogo(),
  );
}