import 'package:flutter/material.dart';

class BioxinFilterIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3428730, size.height * 0.5253050);
    path_0.cubicTo(
        size.width * 0.2184505,
        size.height * 0.4322800,
        size.width * 0.1297820,
        size.height * 0.3299575,
        size.width * 0.08136700,
        size.height * 0.2724335);
    path_0.cubicTo(
        size.width * 0.06638000,
        size.height * 0.2546265,
        size.width * 0.06146900,
        size.height * 0.2415950,
        size.width * 0.05851650,
        size.height * 0.2186400);
    path_0.cubicTo(
        size.width * 0.04840555,
        size.height * 0.1400400,
        size.width * 0.04335055,
        size.height * 0.1007400,
        size.width * 0.06639750,
        size.height * 0.07537000);
    path_0.cubicTo(
        size.width * 0.08944500,
        size.height * 0.05000000,
        size.width * 0.1302020,
        size.height * 0.05000000,
        size.width * 0.2117165,
        size.height * 0.05000000);
    path_0.lineTo(size.width * 0.7882850, size.height * 0.05000000);
    path_0.cubicTo(
        size.width * 0.8698000,
        size.height * 0.05000000,
        size.width * 0.9105550,
        size.height * 0.05000000,
        size.width * 0.9336000,
        size.height * 0.07537000);
    path_0.cubicTo(
        size.width * 0.9566500,
        size.height * 0.1007400,
        size.width * 0.9515950,
        size.height * 0.1400400,
        size.width * 0.9414850,
        size.height * 0.2186405);
    path_0.cubicTo(
        size.width * 0.9385300,
        size.height * 0.2415955,
        size.width * 0.9336200,
        size.height * 0.2546270,
        size.width * 0.9186300,
        size.height * 0.2724335);
    path_0.cubicTo(
        size.width * 0.8701500,
        size.height * 0.3300310,
        size.width * 0.7813050,
        size.height * 0.4325350,
        size.width * 0.6566300,
        size.height * 0.5256750);
    path_0.cubicTo(
        size.width * 0.6453500,
        size.height * 0.5341050,
        size.width * 0.6379150,
        size.height * 0.5478350,
        size.width * 0.6365350,
        size.height * 0.5630700);
    path_0.cubicTo(
        size.width * 0.6241850,
        size.height * 0.6996000,
        size.width * 0.6127950,
        size.height * 0.7743800,
        size.width * 0.6057050,
        size.height * 0.8122100);
    path_0.cubicTo(
        size.width * 0.5942650,
        size.height * 0.8732850,
        size.width * 0.5076600,
        size.height * 0.9100300,
        size.width * 0.4613000,
        size.height * 0.9428150);
    path_0.cubicTo(
        size.width * 0.4337050,
        size.height * 0.9623300,
        size.width * 0.4002150,
        size.height * 0.9391000,
        size.width * 0.3966390,
        size.height * 0.9088900);
    path_0.cubicTo(
        size.width * 0.3898215,
        size.height * 0.8513050,
        size.width * 0.3769805,
        size.height * 0.7343200,
        size.width * 0.3629635,
        size.height * 0.5630700);
    path_0.cubicTo(
        size.width * 0.3617045,
        size.height * 0.5476950,
        size.width * 0.3542430,
        size.height * 0.5338050,
        size.width * 0.3428730,
        size.height * 0.5253050);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07500000;
    paint0Stroke.color = Colors.white.withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
