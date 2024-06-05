import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu, size: 24), 
            onPressed: () {
            },
          ),
           Text(
            'Face Scan Results  ',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              // letterSpacing: -0.50,
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/ana3.jpg'),
          ),
        ],
      ),
    );
  }
}
