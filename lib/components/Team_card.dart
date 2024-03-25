import 'package:flutter/material.dart';

class Team_card extends StatelessWidget {
  const Team_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      height: 200, // Set the height of the container as needed
      child: Center(
        child: Card(
          elevation: 5,
          child: SizedBox(
            width: 150, // Set the width of the card as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 40), // Set the size of the icon
                SizedBox(height: 8),
                Text(
                  'M.fahad', // Replace with the desired name
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Flutter Developer', // Replace with the desired profession
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
