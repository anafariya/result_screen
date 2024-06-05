import 'package:flutter/material.dart';

class LinearBar extends StatelessWidget {
  final double value;
  final double lowValue;
  final double midValue;
  final double highValue;
  final Color lowColor;
  final Color midColor;
  final Color highColor;
  final double borderRadius;

  LinearBar({
    required this.value,
    required this.lowValue,
    required this.midValue,
    required this.highValue,
    required this.lowColor,
    required this.midColor,
    required this.highColor,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: value < midValue ? lowColor : Colors.transparent,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(borderRadius),
                      right: value >= midValue ? Radius.circular(0) : Radius.circular(borderRadius),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2),
              Expanded(
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: value >= midValue && value < highValue ? midColor : Colors.transparent,
                  ),
                ),
              ),
              SizedBox(width: 2),
              Expanded(
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: value >= highValue ? highColor : Colors.transparent,
                    borderRadius: BorderRadius.horizontal(
                      left: value < midValue ? Radius.circular(0) : Radius.circular(borderRadius),
                      right: Radius.circular(borderRadius),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
