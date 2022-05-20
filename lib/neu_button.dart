import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NeuButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final double border;
  final bool isActive;
  final bool isLoading;
  final Color color;
  final double borderRadius;
  final double depth;

  const NeuButton(
      {Key? key,
        required this.onPressed,
        required this.child,
        required this.border,
        this.borderRadius = 200,
        this.isActive = true,
        this.depth = -10,
        this.color = Colors.indigo,
        this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed:
        (this.isActive && !this.isLoading) ? this.onPressed : () => {},
        style: NeumorphicStyle(
            intensity: .3,
            color: Colors.grey[900],
            depth: depth,
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(borderRadius))),
        padding: EdgeInsets.all(this.border),
        child: Neumorphic(
            style: NeumorphicStyle(
                intensity: .4,
                color: (this.isActive && !this.isLoading)
                    ? color
                    : Colors.grey[600],
                depth: depth,
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(borderRadius))),
            child: this.isLoading
                ? SpinKitThreeBounce(
              color: Colors.white,
              size: 20.0,
            )
                : this.child));
  }
}
