import 'package:flutter/material.dart';
import 'package:shopping_project/screens/signin_screen.dart';
import 'package:shopping_project/screens/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(248, 255, 255, 255),
        title: Text(
          'TechZone',
          style: TextStyle(
            color: const Color.fromARGB(255, 64, 83, 225),
            fontFamily: "Suwannaphum-Regular",
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 130),
          Text(
            "   Welcome to TechZone,  ",
            style: TextStyle(
              color: Color.fromARGB(255, 64, 83, 225),
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
              fontSize: 29.0,
            ),
          ),
          SizedBox(height: 6),
          Text(
            " Your Digital Gear Hub",
            style: TextStyle(
              color: Color.fromARGB(255, 64, 83, 225),
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
              fontSize: 29.0,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Wel.jpg",
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Image.network(
                'https://images.pexels.com/photos/1309766/pexels-photo-1309766.jpeg',
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(height: 30.0),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Color.fromARGB(255, 64, 83, 225),
                  fontFamily: "Suwannaphum-Regular",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SigninScreen()),
                );
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Color.fromARGB(255, 64, 83, 225),
                  fontFamily: "Suwannaphum-Regular",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
