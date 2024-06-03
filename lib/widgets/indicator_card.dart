import 'package:flutter/material.dart';
import 'curved_end_linear_progress_indicator.dart'; // Import the custom progress indicator

class IndicatorCard extends StatelessWidget {
  final String title;
  final String unit;
  final double value;
  final double v1;
  final double v2;
  final double v3;
  final double v4;
  final Color lowColor;
  final Color midColor;
  final Color highColor;

  const IndicatorCard({
    super.key,
    required this.title,
    required this.unit,
    required this.value,
    required this.v1,
    required this.v2,
    required this.v3,
    required this.v4,
    required this.lowColor,
    required this.midColor,
    required this.highColor,
  });

  Color getValueColor(double value) {
    if (value >= v1 && value < v2) {
      return lowColor;
    } else if (value >= v2 && value < v3) {
      return midColor;
    } else if (value >= v3 && value <= v4) {
      return highColor;
    }
    return Colors.grey[300]!;
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = Colors.grey[300]!;
    Color color2 = Colors.grey[300]!;
    Color color3 = Colors.grey[300]!;

    if (value >= v1 && value < v2) {
      color1 = lowColor;
      color2 = Colors.grey[300]!;
      color3 = Colors.grey[300]!;
    } else if (value >= v2 && value < v3) {
      color1 = Colors.grey[300]!;
      color2 = midColor;
      color3 = Colors.grey[300]!;
    } else if (value >= v3 && value <= v4) {
      color1 = Colors.grey[300]!;
      color2 = Colors.grey[300]!;
      color3 = highColor;
    }

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
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 10), // Added SizedBox
                Expanded(
                  child: Text(
                    'Low',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Medium',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Text(
                    'High',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$value",
                      style:
                          TextStyle(fontSize: 18, color: getValueColor(value)),
                    ),
                    Text(
                      unit,
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
                          value: (value - v1) / (v2 - v1),
                          color: color1,
                          backgroundColor: Colors.grey[300]!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CurvedEndLinearProgressIndicator(
                          value: (value - v2) / (v3 - v2),
                          color: color2,
                          backgroundColor: Colors.grey[300]!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CurvedEndLinearProgressIndicator(
                          value: (value - v3) / (v4 - v3),
                          color: color3,
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
