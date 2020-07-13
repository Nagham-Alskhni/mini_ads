import 'package:flutter/material.dart';

class MyGradientButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  const MyGradientButton({Key key, this.child, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300, blurRadius: 2, spreadRadius: 2)
            ],
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: [Color(0xff96deda), Color(0xff50c9c3)],
            )),
        child: Center(child: child),
      ),
    );
  }
}
