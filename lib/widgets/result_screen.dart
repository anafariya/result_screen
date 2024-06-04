import 'package:flutter/material.dart';
import 'package:result_screen/widgets/double_indicator_card.dart';
import '../widgets/header.dart';
import '../widgets/indicator_card.dart';
import '../widgets/capsule_button.dart';
import 'curved_end_circular_progress_indicator.dart'; // Import your custom widget

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
    const overallScore = 95; // This should be the actual overall score

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const SizedBox(height: 60),
            Header(),
            const SizedBox(height: 40),
          ],
        ),
        automaticallyImplyLeading: false, // Removes default back arrow
      ),
      backgroundColor: Colors.white, // Set the background color to white
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                CurvedEndCircularProgressIndicator(
                  radius: 101.0,
                  lineWidth: 10.0,
                  percent: 1.0,
                  backgroundColor: Colors.black.withOpacity(0.05),
                  progressColor: Colors.transparent,
                ),
                Transform.rotate(
                  angle: -3.14, // Rotate 180 degrees in radians (pi radians)
                  child: CurvedEndCircularProgressIndicator(
                    radius: 90.0,
                    lineWidth: 10.0,
                    percent: 0.95,
                    backgroundColor: Colors.transparent,
                    progressColor: Colors.green,
                    center: Transform.rotate(
                      angle: 3.14, // Rotate 180 degrees in radians (pi radians)
                      child: const Text(
                        '$overallScore/100',
                        style: TextStyle(
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
              text: const TextSpan(
                text: 'Your wellbeing score is ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  if (overallScore > 70)
                    TextSpan(
                      text: 'Excellent',
                      style: TextStyle(color: Colors.green),
                    )
                  else if (overallScore > 40)
                    TextSpan(
                      text: 'Good',
                      style: TextStyle(color: Colors.blue),
                    )
                  else
                    TextSpan(
                      text: 'Poor',
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'The measured indicators are not intended for medical use',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins',
                height: 0.24,
              ),
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CapsuleButton(
                  text: 'Key Body Vitals',
                  isSelected: selectedIndex == 0,
                  onPressed: () => onButtonPressed(0),
                ),
                CapsuleButton(
                  text: 'Heart Health',
                  isSelected: selectedIndex == 1,
                  onPressed: () => onButtonPressed(1),
                ),
                CapsuleButton(
                  text: 'Sugar Health',
                  isSelected: selectedIndex == 2,
                  onPressed: () => onButtonPressed(2),
                ),
              ],
            ),
            const SizedBox(height: 10), // Add a small gap between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CapsuleButton(
                  text: 'Lung Health',
                  isSelected: selectedIndex == 3,
                  onPressed: () => onButtonPressed(3),
                ),
                CapsuleButton(
                  text: 'Anaemia Health',
                  isSelected: selectedIndex == 4,
                  onPressed: () => onButtonPressed(4),
                ),
                CapsuleButton(
                  text: 'Age Analysis',
                  isSelected: selectedIndex == 5,
                  onPressed: () => onButtonPressed(5),
                ),
              ],
            ),
            const SizedBox(height: 11),
            const IndicatorCard(
              title: 'Heart Rate',
              unit: 'BPM',
              value: 65,
              v1: 30,
              v2: 60,
              v3: 101,
              v4: 120,
              lowColor: Colors.green,
              midColor: Colors.orange,
              highColor: Colors.red,
            ),
            const SizedBox(height: 24), // Add a small gap between cards
            const DoubleIndicatorCard(
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
              lowColor: Colors.green,
              midColor: Colors.orange,
              highColor: Colors.red,
            ),
            const SizedBox(height: 24), // Add a small gap between cards
            const IndicatorCard(
              title: 'Oxygen Level',
              unit: 'SpO2',
              value: 98,
              v1: 80,
              v2: 91,
              v3: 94,
              v4: 100,
              lowColor: Colors.red,
              midColor: Colors.orange,
              highColor: Colors.green,
            ),
            const SizedBox(height: 24), // Add a small gap between cards
            const IndicatorCard(
              title: 'Hemoglobin',
              unit: 'g/dl',
              value: 15,
              v1: 10,
              v2: 14,
              v3: 16,
              v4: 18,
              lowColor: Colors.red,
              midColor: Colors.orange,
              highColor: Colors.green,
            ),
            const SizedBox(height: 24), // Add a small gap between cards
            const IndicatorCard(
              title: 'Glycated Hemoglobin',
              unit: 'HbA1c',
              value: 7.0,
              v1: 5.0,
              v2: 5.6,
              v3: 6.4,
              v4: 9.0,
              lowColor: Colors.green,
              midColor: Color.fromRGBO(218, 76, 104, 1),
              highColor: Color.fromRGBO(220, 125, 87, 1),
            ),
            const SizedBox(height: 23),
            Container(
              width: 247,
              height: 48,
              padding: const EdgeInsets.only(
                  left: 50.0,
                  top: 12.0,
                  right: 20.0,
                  bottom: 12.0), // Adjust values as needed
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFDC7D57)),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                // Remove mainAxisAlignment
                mainAxisSize: MainAxisSize.max, // Set max width
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center vertically
                children: [
                  Text(
                    'Back to Home page',
                    textAlign:
                        TextAlign.center, // Center text within its line box
                    style: TextStyle(
                      color: Color(0xFFDC7D57),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0, // Remove line height if needed
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              'Take scan again',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF213D68),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
