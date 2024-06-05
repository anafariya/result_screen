import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final String dialogTitle;
  final String lowValue;
  final String midValue;
  final String highValue;
  final String resultValue;
  final String dialogDescription;
  late String dialogContent; // New property for the content

  IndicatorCard({
    super.key,
    required this.title,
    required this.unit,
    required this.value,
    required this.resultValue,
    required this.v1,
    required this.v2,
    required this.v3,
    required this.v4,
    required this.lowValue,
    required this.midValue,
    required this.highValue,
    required this.lowColor,
    required this.midColor,
    required this.highColor,
    required this.dialogTitle,
    required this.dialogDescription,
  }) {
    dialogContent = _generateDefaultContent(
        title, value); // Initialize in the constructor body
  }

  String _generateDefaultContent(String title, double value) {
    return "Your $title is $value";
  }

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
        padding: const EdgeInsets.only(left:9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    )),
                IconButton(
                  icon: const Icon(Icons.info_outline, size: 11),
                  onPressed: () => _showInfoDialog(context, title,
                      dialogContent, dialogDescription), // Show the dialog
                ),
              ],
            ),
             Padding(
              padding:  const EdgeInsets.only(
                  left: 75,
                  bottom: 0), // Set your desired left padding here
              child:  SizedBox(
                width: 255, // Set your desired width here
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        lowValue,
                        textAlign: TextAlign.left,
                        style:  GoogleFonts.poppins(
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        midValue,
                        textAlign: TextAlign.center,
                        style:  GoogleFonts.poppins(
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        highValue,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$value $resultValue",
                        style:
                            GoogleFonts.poppins(fontSize: 14, color: getValueColor(value)),
                      ),
                      Text(
                        unit,
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 275,
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
                                      color: value < v2
                                          ? lowColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: value >= v2 && value < v3
                                          ? midColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: value >= v3
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
                        width: 270,
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
