import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final String lowValue;
  final String midValue;
  final String highValue;
  final Color lowColor;
  final Color midColor;
  final Color highColor;
  final String dialogTitle;
  final String dialogDescription;
  late String dialogContent;

  DoubleIndicatorCard({
    super.key,
    required this.title,
    required this.unit1,
    required this.unit2,
    required this.value1,
    required this.value2,
    required this.lowValue,
    required this.midValue,
    required this.highValue,
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
    required this.dialogTitle,
    required this.dialogDescription,
  }) {
    dialogContent = _generateDefaultContent(
        title, value1, value2); // Initialize in the constructor body
  }

  String _generateDefaultContent(String title, double value1, double value2) {
    return "Your $title is ${value1.toStringAsFixed(0)} / ${value2.toStringAsFixed(0)}";
  }

  Color getValueColor(
      double value, double minValue, double midValue, double maxValue) {
    if (value < (minValue + midValue) / 2) {
      return lowColor;
    } else if (value < midValue) {
      return midColor;
    } else {
      return highColor;
    }
  }

  void _showInfoDialog(
      BuildContext context, String title, String content, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius:
              BorderRadius.circular(10.0), // Set the desired border radius here
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24, // Set the desired size here
                      height: 24,
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFD9D9D9)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.close),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  content,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Padding(
        padding: const EdgeInsets.only(left: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 9, right: 12, top: 7, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      )),
                  GestureDetector(
                    onTap: () => _showInfoDialog(context, title, dialogContent,
                        dialogDescription), // Show the dialog
                    child: const Icon(Icons.info_outline, size: 11),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27, bottom: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$value1",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: value1 > v3
                                  ? highColor
                                  : value1 > v2
                                      ? midColor
                                      : lowColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              "mmHG",
                              style: GoogleFonts.poppins(fontSize: 6),
                            ),
                          )
                        ],
                      ),
                      Text(
                        unit1,
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, bottom: 10),
                        child: SizedBox(
                          width: 233,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 10), // Added SizedBox
                              Expanded(
                                child: Text(
                                  lowValue,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  midValue,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  highValue,
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 235,
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Stack(
                          children: [
                            // Background container with curved edges
                            Container(
                              width: double.infinity,
                              height: 7,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            // Row with the three colored containers with curved edges
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: value1 < v2
                                          ? lowColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: Container(
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: value1 >= v2 && value1 < v3
                                          ? midColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: Container(
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: value1 >= v3
                                          ? highColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: SizedBox(
                          width: 231,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$v1",
                                style: GoogleFonts.poppins(
                                    fontSize: 8, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "$v2",
                                style: GoogleFonts.poppins(
                                    fontSize: 8, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "$v3",
                                style: GoogleFonts.poppins(
                                    fontSize: 8, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "$v4",
                                style: GoogleFonts.poppins(
                                    fontSize: 8, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$value2",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: value1 > v3
                                  ? highColor
                                  : value1 > v2
                                      ? midColor
                                      : lowColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              "mmHG",
                              style: GoogleFonts.poppins(fontSize: 6),
                            ),
                          )
                        ],
                      ),
                      Text(
                        unit2,
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 235,
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Stack(
                          children: [
                            // Background container with curved edges
                            Container(
                              width: double.infinity,
                              height: 7,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            // Row with the three colored containers with curved edges
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: value2 < x2
                                          ? lowColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: Container(
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: value2 >= x2 && value2 < x3
                                          ? midColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: Container(
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: value2 >= x3
                                          ? highColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 231,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$x1",
                              style: GoogleFonts.poppins(
                                  fontSize: 8, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "$x2",
                              style: GoogleFonts.poppins(
                                  fontSize: 8, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "$x3",
                              style: GoogleFonts.poppins(
                                  fontSize: 8, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "$x4",
                              style: GoogleFonts.poppins(
                                  fontSize: 8, fontWeight: FontWeight.w500),
                            ),
                          ],
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
