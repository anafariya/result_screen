import 'package:flutter/material.dart';
import 'curved_end_linear_progress_indicator.dart';

class DoubleIndicatorCard extends StatelessWidget {
  final String title;
  final String unit1;
  final String unit2;
  final double value1;
  final double value2;
  final double v1;
  final double v2;
  final double v3;
  final double v4;
  final double x1;
  final double x2;
  final double x3;
  final double x4;
  final Color lowColor;
  final Color midColor;
  final Color highColor;

  const DoubleIndicatorCard({
    super.key,
    required this.title,
    required this.unit1,
    required this.unit2,
    required this.value1,
    required this.value2,
    required this.v1,
    required this.v2,
    required this.v3,
    required this.v4,
    required this.x1,
    required this.x2,
    required this.x3,
    required this.x4,
    required this.lowColor,
    required this.midColor,
    required this.highColor,
  });

  Color getValueColor(double value, double minValue, double midValue, double maxValue) {
    if (value < (minValue + midValue) / 2) {
      return lowColor;
    } else if (value < midValue) {
      return midColor;
    } else {
      return highColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    double midValue1 = (v2 + v3) / 2;
    double midValue2 = (x2 + x3) / 2;

    return Card(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline, size: 19),
                  onPressed: () {
                    // Add your information dialog or action here
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$value1",
                      style: TextStyle(
                        fontSize: 18,
                        color: getValueColor(value1, v1, midValue1, v4),
                      ),
                    ),
                    Text(
                      unit1,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: CurvedEndLinearProgressIndicator(
                          value: (value1 - v1) / (v2 - v1),
                          color: value1 >= v1 && value1 < v2
                              ? getValueColor(value1, v1, midValue1, v4)
                              : Colors.grey[300]!,
                          backgroundColor: Colors.grey[300]!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CurvedEndLinearProgressIndicator(
                          value: (value1 - v2) / (v3 - v2),
                          color: value1 >= v2 && value1 < v3
                              ? getValueColor(value1, v1, midValue1, v4)
                              : Colors.grey[300]!,
                          backgroundColor: Colors.grey[300]!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CurvedEndLinearProgressIndicator(
                          value: (value1 - v3) / (v4 - v3),
                          color: value1 >= v3 && value1 < v4
                              ? getValueColor(value1, v1, midValue1, v4)
                              : Colors.grey[300]!,
                          backgroundColor: Colors.grey[300]!,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$value2",
                      style: TextStyle(
                        fontSize: 18,
                        color: getValueColor(value2, x1, midValue2, x4),
                      ),
                    ),
                    Text(
                      unit2,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: CurvedEndLinearProgressIndicator(
                          value: (value2 - x1) / (x2 - x1),
                          color: value2 >= x1 && value2 < x2
                              ? getValueColor(value2, x1, midValue2, x4)
                              : Colors.grey[300]!,
                          backgroundColor: Colors.grey[300]!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CurvedEndLinearProgressIndicator(
                          value: (value2 - x2) / (x3 - x2),
                          color: value2 >= x2 && value2 < x3
                              ? getValueColor(value2, x1, midValue2, x4)
                              : Colors.grey[300]!,
                          backgroundColor: Colors.grey[300]!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CurvedEndLinearProgressIndicator(
                          value: (value2 - x3) / (x4 - x3),
                          color: value2 >= x3 && value2 < x4
                              ? getValueColor(value2, x1, midValue2, x4)
                              : Colors.grey[300]!,
                          backgroundColor: Colors.grey[300]!,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
