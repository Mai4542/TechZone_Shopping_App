import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_project/screens/home_screen.dart';
import 'package:shopping_project/screens/welcome_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formin = GlobalKey<FormState>();
  bool showORhide3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "  Welcome Back",
          style: TextStyle(
            color: Color.fromARGB(255, 64, 83, 225),
            fontFamily: "Suwannaphum-Regular",
            fontWeight: FontWeight.bold,
            fontSize: 29.0,
          ),
        ),
      ),
      body: Form(
        key: _formin,
        child: ListView(
          children: [
            
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " Sign in to TechZone",
                  style: TextStyle(
                    color: Color.fromARGB(255, 108, 108, 111),
                    fontFamily: "Suwannaphum-Regular",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "  Email",
                style: TextStyle(
                  fontFamily: "Suwannaphum-Regular",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  switch (value) {
                    case null || '':
                      return "Email is required";

                    case String v when v.contains("@") == false:
                      return "Email must include @";

                    case String v when v[v.length - 1] == "@":
                      return "Email incomplete";
                    default:
                      return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "  Password",
                style: TextStyle(
                  fontFamily: "Suwannaphum-Regular",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: showORhide3,
                validator: (value) {
                  switch (value) {
                    case null || '':
                      return "Password is required";

                    case String v when v.length < 6:
                      return "Password must be at least 6 characters ";

                    default:
                      return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter your password ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  suffixIcon: IconButton(
                    onPressed: () {
                      togglePASS3();
                    },
                    icon: Icon(
                      showORhide3 ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (_formin.currentState!.validate()) {
                  final prefs = await SharedPreferences.getInstance();
                  String? storedEmail = prefs.getString("email");
                  String? storedPassword = prefs.getString("password");
                  if (emailController.text == storedEmail &&
                      passwordController.text == storedPassword) {
                    showMyDialog2(context);
                  } else {
                    showMyDialogError(context);
                  }
                }
              },
              child: Text("Sign Up",style: TextStyle(
            color: Color.fromARGB(255, 64, 83, 225),
            fontFamily: "Suwannaphum-Regular",
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          )),
              
            ),
          ],
        ),
      ),
    );
  }

  togglePASS3() {
    showORhide3 = !showORhide3;
    setState(() {});
  }

  Future showMyDialog2(BuildContext context) => showModal(
      configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(seconds: 4),
      ),
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Welcome!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Account sign-in successfully",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white, 
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 12), 
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8), 
      )
      ),
              child: const Text(
                'Close',
                textAlign: TextAlign.center, 
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Suwannaphum-Regular",
                  fontWeight: FontWeight.bold,
                ),
              ),

               onPressed: () {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Mainscreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      transitionDuration: const Duration(milliseconds: 1000), 
    ),
  );
},

            
            ),
          ],
        );
      },
    );
  }

  Future<void> showMyDialogError(dynamic context) async {
    
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Error',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Email or Password is incorrect",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
            backgroundColor: Colors.red, 
            foregroundColor: Colors.white, 
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 12), 
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8),
      )
      ),
              child: const Text(
                'Exit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Suwannaphum-Regular",
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
            ),
            TextButton(
                style: TextButton.styleFrom(
            backgroundColor: Colors.green, 
            foregroundColor: Colors.white, 
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 12),
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8), 
      )
      ),
              child: const Text(
                'Try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Suwannaphum-Regular",
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

