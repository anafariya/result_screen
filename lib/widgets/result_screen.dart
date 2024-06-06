import 'package:flutter/material.dart';
import 'package:result_screen/widgets/double_indicator_card.dart';
import '../widgets/header.dart';
import '../widgets/indicator_card.dart';
import 'curved_end_circular_progress_indicator.dart'; // Import your custom widget
import 'package:google_fonts/google_fonts.dart';
import '../widgets/chips.dart';
import '../widgets//haemoglobin_indicator_card.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int selectedIndex = -1; // -1 means no button is selected

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const overallScore = 60; // This should be the actual overall score

    return Scaffold(
      appBar: AppBar(
        title: Header(),

        automaticallyImplyLeading: false, // Removes default back arrow
      ),
      backgroundColor: Colors.white, // Set the background color to white
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            //padding here
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  CurvedEndCircularProgressIndicator(
                    radius: 60.0,
                    lineWidth: 6.0,
                    percent: 1.0,
                    backgroundColor: Colors.black.withOpacity(0.05),
                    progressColor: Colors.transparent,
                  ),
                  Transform.rotate(
                    angle: -3.14, // Rotate 180 degrees in radians (pi radians)
                    child: CurvedEndCircularProgressIndicator(
                      radius: 55.0,
                      lineWidth: 5.0,
                      percent: overallScore / 100,
                      backgroundColor: Colors.transparent,
                      progressColor: overallScore > 70
                          ? Colors.green
                          : overallScore > 40
                              ? const Color.fromRGBO(33, 61, 104, 0.8)
                              : const Color.fromRGBO(218, 76, 104, 1),
                      center: Transform.rotate(
                        angle:
                            3.14, // Rotate 180 degrees in radians (pi radians)
                        child: Text(
                          '$overallScore/100',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  text: 'Your wellbeing score is ',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    if (overallScore > 70)
                      TextSpan(
                        text: 'Excellent',
                        style: GoogleFonts.poppins(color: Colors.green),
                      )
                    else if (overallScore > 40)
                      TextSpan(
                        text: 'Good',
                        style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(33, 61, 104, 0.8)),
                      )
                    else
                      TextSpan(
                        text: 'Poor',
                        style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(218, 76, 104, 1)),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The measured indicators are not intended for medical use',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 13),
              const ChipSelection(
                categories: [
                  'Key Body Vitals',
                  'Heart Health',
                  'Sugar Health',
                  'Lung Health',
                  'Anaemia Health',
                  'Age Analysis'
                ],
              ),
              const SizedBox(height: 11),
              IndicatorCard(
                title: 'Heart Rate',
                unit: 'BPM',
                value: 65,
                v1: 30,
                v2: 60,
                v3: 101,
                v4: 120,
                resultValue: "",
                midColor: Colors.green,
                lowColor: Colors.orange,
                highColor: const Color.fromRGBO(220, 125, 87, 1),
                lowValue: 'Low',
                midValue: 'Normal',
                highValue: 'High',
                highValuePlusSign: "+",
                dialogTitle: "Heart Rate",
                dialogDescription:
                    "A normal resting heart rate for adults ranges from 60 to 100 beats per minute ",
              ),
              const SizedBox(height: 24), // Add a small gap between cards
              DoubleIndicatorCard(
                title: 'Blood Pressure',
                unit1: 'Systolic',
                unit2: 'Diastolic',
                value1: 101,
                value2: 75,
                v1: 50,
                v2: 100,
                v3: 120,
                v4: 180,
                x1: 30,
                x2: 70,
                x3: 80,
                x4: 90,
                midColor: Colors.green,
                lowColor: Colors.orange,
                highColor: const Color.fromRGBO(220, 125, 87, 1),
                lowValue: 'Low',
                midValue: 'Normal',
                highValue: 'High',
                highValuePlusSign: "+",
                dialogTitle: 'Blood Pressure',
                dialogDescription:
                    "A normal blood pressure reading for a healthy young adult is between 90/60 and 120/80 mmHg.  ",
              ),
              const SizedBox(height: 24), // Add a small gap between cards
              IndicatorCard(
                title: 'Oxygen Level',
                unit: 'SpO2',
                value: 98,
                v1: 80,
                v2: 91,
                v3: 94,
                v4: 100,
                resultValue: "%",
                lowColor: Colors.red,
                midColor: Colors.orange,
                highColor: Colors.green,
                lowValue: 'Low',
                midValue: 'Concerning',
                highValue: 'Normal',
                highValuePlusSign: "",
                dialogTitle: "Oxygen Level",
                dialogDescription: "Oxygen level should be more than 94.",
              ),
              const SizedBox(height: 24), // Add a small gap between cards
              HaemoglobinIndicatorCard(
                title: 'Hemoglobin',
                unit: 'g/dl',
                value: 15,
                v1: 10,
                v2: 14,
                v3: 16,
                v4: 18,
                resultValue: "",
                highColor: Colors.red,
                lowColor: Colors.orange,
                midColor: Colors.green,
                lowValue: 'Low',
                midValue: 'Normal',
                highValue: 'High',
                dialogTitle: "Haemoglobin",
                dialogDescription:
                    "The normal Hb level for males is 14 to 18 g/dl; that for females is 12 to 16 g/dl.",
              ),
              const SizedBox(height: 24), // Add a small gap between cards
              HaemoglobinIndicatorCard(
                title: 'Glycated Hemoglobin',
                unit: 'HbA1c',
                value: 7.0,
                v1: 5.0,
                v2: 5.6,
                v3: 6.4,
                v4: 9.0,
                resultValue: "%",
                lowColor: Colors.green,
                highColor: const Color.fromRGBO(218, 76, 104, 1),
                midColor: const Color.fromRGBO(220, 125, 87, 1),
                lowValue: 'Normal',
                midValue: 'Prediabetic',
                highValue: 'Diabetes',
                dialogTitle: "Glycated Haemoglobin",
                dialogDescription:
                    "A normal glycated haemoglobin level, also called an A1C level, is below 5.7%.",
              ),
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 44),
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 11.0),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFDC7D57),
                        ),
                      ),
                    ),
                    side: WidgetStateProperty.all(
                      const BorderSide(
                        color: Color(0xFFDC7D57),
                        width: 1,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: Text(
                        'Back to Home page',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFDC7D57),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'Take scan again',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Color(0xFF213D68),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
