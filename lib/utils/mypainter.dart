import 'package:flutter/material.dart';

import 'info.dart';

class MyPainter extends StatelessWidget {
  Color color;

  MyPainter(this.color);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: SizeConfig.screenHeight,
      ),
      painter: HomePainter(color),
    );
  }
}

class HomePainter extends CustomPainter {
  Color _color;

  HomePainter(this._color);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();
    path.moveTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 0.65, size.height * 0.9,
        size.width * 0.924, size.height * 0.78);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.75, size.width, size.height * 0.64);
    path.close();

    paint.color = _color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
