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
            icon: const Icon(Icons.menu, size: 30), // Increased icon size
            onPressed: () {
              // Add functionality here
            },
          ),
          const Text(
            'Face Scan Results',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/images/ana3.jpg'),
          ),
        ],
      ),
    );
  }
}
