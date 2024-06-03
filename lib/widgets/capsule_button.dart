import 'package:flutter/material.dart';

class CapsuleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const CapsuleButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,

  }) ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ?  const Color.fromRGBO(220, 125, 87, 0.8) : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          ),
          onPressed: onPressed,
          child: Text(text,
          style:  TextStyle(fontSize: 11,     
          color: isSelected ? Colors.white : Colors.black,
          fontFamily: 'Poppins'),),
        ),
      ),
    );
  }
}
