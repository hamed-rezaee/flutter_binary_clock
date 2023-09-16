import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;

import 'package:flutter_binary_clock/binary_clock.dart';

class BinaryClockPainter extends CustomPainter {
  BinaryClockPainter(this.binaryClock);

  final BinaryClock binaryClock;

  @override
  void paint(Canvas canvas, Size size) {
    final NumberFormat numberFormat = NumberFormat('00');

    binaryClock.drawText(
      canvas,
      size,
      'Hour ${numberFormat.format(binaryClock.hour)}',
    );
    binaryClock.drawBinaryDigit(canvas, size, binaryClock.hour);

    canvas.translate(0, 92);
    binaryClock.drawText(
      canvas,
      size,
      'Minute ${numberFormat.format(binaryClock.minute)}',
    );
    binaryClock.drawBinaryDigit(canvas, size, binaryClock.minute);

    canvas.translate(0, 92);
    binaryClock.drawText(
      canvas,
      size,
      'Second ${numberFormat.format(binaryClock.second)}',
    );
    binaryClock.drawBinaryDigit(canvas, size, binaryClock.second);

    canvas.translate(0, 92);
    binaryClock.drawText(
      canvas,
      size,
      'Millisecond ${numberFormat.format(binaryClock.millisecond)}',
    );
    binaryClock.drawBinaryDigit(canvas, size, binaryClock.millisecond);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}