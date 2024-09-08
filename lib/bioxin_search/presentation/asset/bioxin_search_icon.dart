import 'package:flutter/material.dart';

class BioxinSearchIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9877813, size.height * 0.9288688);
    path_0.lineTo(size.width * 0.7034063, size.height * 0.6444937);
    path_0.cubicTo(
        size.width * 0.7584937,
        size.height * 0.5764531,
        size.width * 0.7916562,
        size.height * 0.4899950,
        size.width * 0.7916562,
        size.height * 0.3958300);
    path_0.cubicTo(size.width * 0.7916562, size.height * 0.1775825,
        size.width * 0.6140762, 0, size.width * 0.3958281, 0);
    path_0.cubicTo(size.width * 0.1775800, 0, 0, size.height * 0.1775800, 0,
        size.height * 0.3958281);
    path_0.cubicTo(
        0,
        size.height * 0.6140762,
        size.width * 0.1775825,
        size.height * 0.7916562,
        size.width * 0.3958300,
        size.height * 0.7916562);
    path_0.cubicTo(
        size.width * 0.4899950,
        size.height * 0.7916562,
        size.width * 0.5764531,
        size.height * 0.7584937,
        size.width * 0.6444937,
        size.height * 0.7034063);
    path_0.lineTo(size.width * 0.9288688, size.height * 0.9877813);
    path_0.cubicTo(
        size.width * 0.9369937,
        size.height * 0.9959062,
        size.width * 0.9476562,
        size.height * 0.9999875,
        size.width * 0.9583250,
        size.height * 0.9999875);
    path_0.cubicTo(
        size.width * 0.9689937,
        size.height * 0.9999875,
        size.width * 0.9796563,
        size.height * 0.9959062,
        size.width * 0.9877813,
        size.height * 0.9877813);
    path_0.cubicTo(
        size.width * 1.004075,
        size.height * 0.9714875,
        size.width * 1.004075,
        size.height * 0.9451563,
        size.width * 0.9877813,
        size.height * 0.9288688);
    path_0.close();
    path_0.moveTo(size.width * 0.3958300, size.height * 0.7083250);
    path_0.cubicTo(
        size.width * 0.2234981,
        size.height * 0.7083250,
        size.width * 0.08333312,
        size.height * 0.5681606,
        size.width * 0.08333312,
        size.height * 0.3958281);
    path_0.cubicTo(
        size.width * 0.08333312,
        size.height * 0.2234956,
        size.width * 0.2234981,
        size.height * 0.08333125,
        size.width * 0.3958300,
        size.height * 0.08333125);
    path_0.cubicTo(
        size.width * 0.5681625,
        size.height * 0.08333125,
        size.width * 0.7083250,
        size.height * 0.2234956,
        size.width * 0.7083250,
        size.height * 0.3958281);
    path_0.cubicTo(
        size.width * 0.7083250,
        size.height * 0.5681606,
        size.width * 0.5681606,
        size.height * 0.7083250,
        size.width * 0.3958300,
        size.height * 0.7083250);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff757C86).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
