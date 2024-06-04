import 'package:flutter/material.dart';

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
          const Text(
            'Face Scan Results  ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.08,
              letterSpacing: -0.50,
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
