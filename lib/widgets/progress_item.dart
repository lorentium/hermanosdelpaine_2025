import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressItem extends StatelessWidget {
  final String label;
  final double percent;

  const ProgressItem({super.key, required this.label, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 8.0,
          percent: percent,
          center: Text("${(percent * 100).toInt()}%"),
          progressColor: Colors.green,
          backgroundColor: Colors.grey.shade300,
          circularStrokeCap: CircularStrokeCap.round,
        ),
        const SizedBox(height: 5),
        Text(label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
