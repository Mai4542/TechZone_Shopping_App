import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_project/screens/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conpassword = TextEditingController();
  bool showORhide = true;
  bool showORhide2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "  Create Account",
          style: TextStyle(
            color: Color.fromARGB(255, 64, 83, 225),
            fontFamily: "Suwannaphum-Regular",
            fontWeight: FontWeight.bold,
            fontSize: 29.0,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " Join TechZone today !",
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
                "  Full Name",
                style: TextStyle(
                  fontFamily: "Suwannaphum-Regular",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

              child: TextFormField(
                controller: name,
                validator: (value) {
                  switch (value) {
                    case null || '':
                      return "Full name is required";

                    case String v when v[0] != v[0].toUpperCase():
                      return "First letter must be uppercase";

                    default:
                      return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter your full name",
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
                controller: email,
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
                controller: password,
                obscureText: showORhide,
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
                      togglePASS();
                    },
                    icon: Icon(
                      showORhide ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "   Confirm Password",
                style: TextStyle(
                  fontFamily: "Suwannaphum-Regular",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: conpassword,
                obscureText: showORhide2,
                validator: (value) {
                  switch (value) {
                    case null || '':
                      return "Please confirm your password";

                    case String v when v != password.text:
                      return "Please,Match your password";

                    default:
                      return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Confirm your password ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  suffixIcon: IconButton(
                    onPressed: () {
                      togglePASS2();
                    },
                    icon: Icon(
                      showORhide2 ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString("name", name.text);
                  await prefs.setString("email", email.text);
                  await prefs.setString("password", password.text);
                  showMyDialog();
                }
              },
              child: Text("Sign Up",style: TextStyle(
            color: Color.fromARGB(255, 64, 83, 225),
            fontFamily: "Suwannaphum-Regular",
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),),
            ),
          ],
        ),
      ),
    );
  }

  togglePASS() {
    showORhide = !showORhide;
    setState(() {});
  }

  togglePASS2() {
    showORhide2 = !showORhide2;
    setState(() {});
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
       
      return  AlertDialog(
          title: const Text('Success!', textAlign: TextAlign.center,style: TextStyle(color: Colors.green,fontFamily: "Suwannaphum-Regular",fontWeight: FontWeight.bold),),
          content: Text("Account created successfully", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Suwannaphum-Regular",fontWeight: FontWeight.bold),),
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
              child: const Text('Close', textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: "Suwannaphum-Regular",fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Mainscreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
