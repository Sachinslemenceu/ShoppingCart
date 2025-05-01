import 'package:flutter/material.dart';
import 'package:shoping_demo/pages/home_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset("assets/images/splash_img.png", height: 300),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "We \nDeliver Grocery at your door steps",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Fresh Items Everyday",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            Spacer(),
            FilledButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text("Get Started"),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
