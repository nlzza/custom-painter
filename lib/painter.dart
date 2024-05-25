import 'package:flutter/material.dart';

class MyPainter extends StatelessWidget {
  const MyPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lines'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: CustomPaint(
          painter: ShapePainter(),
          child: Container(),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    // Line
    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(startingPoint, endingPoint, paint);

    // Circle
    paint.color = Colors.red;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 50, paint);

    // Square
    var radius = 75;
    paint.color = Colors.black;
    startingPoint = Offset(center.dx - radius, center.dy);
    endingPoint = Offset(center.dx, center.dy - radius);
    canvas.drawLine(startingPoint, endingPoint, paint);

    startingPoint = endingPoint;
    endingPoint = Offset(center.dx + radius, center.dy);
    canvas.drawLine(startingPoint, endingPoint, paint);

    startingPoint = endingPoint;
    endingPoint = Offset(center.dx, center.dy + radius);
    canvas.drawLine(startingPoint, endingPoint, paint);

    startingPoint = endingPoint;
    endingPoint = Offset(center.dx - radius, center.dy);
    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
