import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;

import 'package:flutter_binary_clock/binary_clock.dart';

final NumberFormat numberFormat2Digits = NumberFormat('00');
final NumberFormat numberFormat3Digits = NumberFormat('000');

class BinaryClockPainter extends CustomPainter {
  BinaryClockPainter(this.binaryClock);

  final BinaryClock binaryClock;

  @override
  void paint(Canvas canvas, Size size) {
    _drawSingleRowClock(canvas, size);

    canvas.translate(0, 128);

    _drawClock(canvas, size);
  }

  void _drawSingleRowClock(Canvas canvas, Size size) {
    binaryClock
      ..drawText(
        canvas,
        size,
        '${numberFormat2Digits.format(binaryClock.hour)} : ${numberFormat2Digits.format(binaryClock.minute)} : ${numberFormat2Digits.format(binaryClock.second)} : ${numberFormat3Digits.format(binaryClock.millisecond)}',
      )
      ..drawBinaryDigitSingleRow(
        canvas,
        size,
        binaryClock.hour,
        binaryClock.minute,
        binaryClock.second,
      );
  }

  void _drawClock(Canvas canvas, Size size) {
    binaryClock
      ..drawText(
        canvas,
        size,
        'Hour ${numberFormat2Digits.format(binaryClock.hour)}',
      )
      ..drawBinaryDigit(canvas, size, binaryClock.hour);

    canvas.translate(0, size.height / 2);
    binaryClock
      ..drawText(
        canvas,
        size,
        'Minute ${numberFormat2Digits.format(binaryClock.minute)}',
      )
      ..drawBinaryDigit(canvas, size, binaryClock.minute);

    canvas.translate(0, size.height / 2);
    binaryClock
      ..drawText(
        canvas,
        size,
        'Second ${numberFormat2Digits.format(binaryClock.second)}',
      )
      ..drawBinaryDigit(canvas, size, binaryClock.second);

    canvas.translate(0, size.height / 2);
    binaryClock
      ..drawText(
        canvas,
        size,
        'Millisecond ${numberFormat3Digits.format(binaryClock.millisecond)}',
      )
      ..drawBinaryDigit(canvas, size, binaryClock.millisecond);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
