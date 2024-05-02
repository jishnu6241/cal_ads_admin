import 'package:cal_ads_admin/utils/custom_alert_dialog.dart';
import 'package:cal_ads_admin/utils/custom_button.dart';
import 'package:cal_ads_admin/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  void toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        if (FirebaseAuth.instance.currentUser!.email == 'admin@calads.com') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 400),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(20),
            color: Colorconstant.primerycolor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.lilyScriptOne(
                          fontSize: 50, color: Colorconstant.secondarycolor),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text.trim())) {
                          return null;
                        } else {
                          return "enter a valid email";
                        }
                      },
                      controller: _emailController,
                      style: GoogleFonts.poppins(
                          color: Colorconstant.primerycolor,
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.length >= 6) {
                          return null;
                        } else {
                          return "Enter a valid password";
                        }
                      },
                      controller: _passwordController,
                      obscureText: obscureText,
                      obscuringCharacter: '*',
                      style: GoogleFonts.poppins(
                          color: Colorconstant.primerycolor,
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                            onTap: () {
                              toggleObscure();
                            },
                            child: Icon(obscureText == true
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      label: 'Login',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim())
                              .then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                    (route) => false),
                              )
                              .onError((error, stackTrace) {
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                title: 'Error',
                                label: "something went wrong",
                                onOk: () {
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
