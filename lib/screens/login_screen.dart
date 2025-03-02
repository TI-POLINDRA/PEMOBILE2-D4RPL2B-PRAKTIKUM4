import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/fa6_brands.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/components/custom_button.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/components/input_field.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 19, 16, 66),
              const Color.fromARGB(255, 18, 18, 18),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Log In",
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  SizedBox(height: 5),
                  Text("Please sign in to your existing account",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 35),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      // Input Email
                      Text("EMAIL", style: TextStyle(color: Colors.black)),
                      SizedBox(height: 8),
                      CustomEmailInput(
                        controller: emailController,
                        hintText: 'example@email.com',
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 23),
                      ),

                      SizedBox(height: 40),

                      // Input Password
                      Text("PASSWORD", style: TextStyle(color: Colors.black)),
                      SizedBox(height: 8),
                      CustomPasswordInput(
                        controller: passwordController,
                        hintText: '* * * * * * * * * *',
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 23),
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isCheck,
                                onChanged: (value) {
                                  setState(() {
                                    isCheck = value ??
                                        false; // Update status checkbox
                                  });
                                },
                              ),
                              Text("Remember me"),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot');
                            },
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      CustomButton(
                        text: "Log In",
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        color: Colors.orange,
                        paddingVertical: 25,
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              children: [
                                TextSpan(
                                  text: "SIGN UP",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Center(child: Text("Or")),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.blue[800],
                            child: Iconify(
                              Fa6Brands
                                  .facebook_f, // Ikon Facebook dari FontAwesome 6
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          SizedBox(width: 45),
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.blue,
                            child: Iconify(
                              Mdi.twitter, // Ikon Email dari Material Design Icons
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          SizedBox(width: 45),
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.black,
                            child: Iconify(
                              Mdi.apple, // Ikon Android dari Material Design Icons
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
