import 'package:flutter/material.dart';

import 'package:flutter_binary_clock/binary_clock.dart';
import 'package:flutter_binary_clock/binary_clock_painter.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final BinaryClock binaryClock = BinaryClock();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: StreamBuilder(
          stream: binaryClock.update(),
          initialData: binaryClock,
          builder: (context, snapshot) => CustomPaint(
            size: const Size(200, 200),
            painter: BinaryClockPainter(snapshot.data!),
          ),
        ),
      ),
    );
  }
}
