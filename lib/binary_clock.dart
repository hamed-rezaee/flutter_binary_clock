import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BinaryClock {
  int hour = 0;
  int minute = 0;
  int second = 0;
  int millisecond = 0;

  Stream<BinaryClock> update() async* {
    while (true) {
      final DateTime dateTime = DateTime.now();

      hour = dateTime.hour;
      minute = dateTime.minute;
      second = dateTime.second;
      millisecond = dateTime.millisecond;

      await Future<void>.delayed(const Duration(milliseconds: 1));

      yield this;
    }
  }

  void drawBinaryDigit(
    Canvas canvas,
    Size size,
    int value, [
    Color color = Colors.green,
  ]) {
    final List<bool> binary = _getBinary(value);

    final Paint paint = Paint()
      ..strokeWidth = 2
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 16);

    for (int i = 0; i < binary.length; i++) {
      final double x = size.width / 2 + (i - 1) * size.width / 4;
      final double y = size.height / 2;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(x, y),
            width: size.width / 5,
            height: size.height / 5,
          ),
          const Radius.circular(4),
        ),
        paint
          ..style = binary[i] ? PaintingStyle.fill : PaintingStyle.stroke
          ..color = color.withOpacity(binary[i] ? 1.0 : 0.5),
      );
    }
  }

  void drawText(
    Canvas canvas,
    Size size,
    String text, [
    Color color = Colors.yellow,
  ]) {
    final TextPainter painter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: size.width / 8,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.oxanium().fontFamily,
          shadows: <Shadow>[Shadow(color: color, blurRadius: 16)],
        ),
      ),
    )..layout(minWidth: size.width);

    painter.paint(
      canvas,
      Offset(
        painter.width / 2 - painter.width / 3,
        painter.height / 2 + painter.width / 8,
      ),
    );
  }

  List<bool> _getBinary(int value) {
    final List<bool> binary = <bool>[];

    for (int i = 0; i < 10; i++) {
      binary.add(value % 2 == 1);
      value = value ~/ 2;
    }

    return binary.reversed.toList();
  }
}
