import 'package:flutter/material.dart';

Widget searchIcon({required double size}) {
  return CustomPaint(
    size: Size(size,size),
    painter: Search(),
  );
}

class Search extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(size.width*0.9166667,size.height*0.9166667);
    path_0.lineTo(size.width*0.7152778,size.height*0.7152778);
    path_0.moveTo(size.width*0.8240722,size.height*0.4537039);
    path_0.cubicTo(size.width*0.8240722,size.height*0.6582556,size.width*0.6582556,size.height*0.8240722,size.width*0.4537039,size.height*0.8240722);
    path_0.cubicTo(size.width*0.2491539,size.height*0.8240722,size.width*0.08333333,size.height*0.6582556,size.width*0.08333333,size.height*0.4537039);
    path_0.cubicTo(size.width*0.08333333,size.height*0.2491539,size.width*0.2491539,size.height*0.08333333,size.width*0.4537039,size.height*0.08333333);
    path_0.cubicTo(size.width*0.6582556,size.height*0.08333333,size.width*0.8240722,size.height*0.2491539,size.width*0.8240722,size.height*0.4537039);
    path_0.close();

Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.09259278;
paint_0_stroke.color=Color(0xff98A2B3).withOpacity(1.0);
paint_0_stroke.strokeCap = StrokeCap.round;
paint_0_stroke.strokeJoin = StrokeJoin.round;
canvas.drawPath(path_0,paint_0_stroke);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}