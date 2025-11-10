
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_textaction.dart';
import 'package:chat_app/widgets/custom_textfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? fullName;
  String? email;
  String? password;
  String? confirmPassword;

  bool isLoading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/scholar.png', height: 100),
      
                      const SizedBox(height: 15),
      
                      const Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
      
                      const SizedBox(height: 40),
      
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white24),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'Full Name',
                              icon: Icons.person,
                              onChanged: (data) => fullName = data,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              },
                            ),
      
                            SizedBox(height: 15),
                            CustomTextField(
                              hintText: 'Email',
                              icon: Icons.email,
                              onChanged: (data) => email = data,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email";
                                }
                                if (!value.contains('@')) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            CustomTextField(
                              hintText: 'Password',
                              icon: Icons.lock,
                              obscure: true,
                              onChanged: (data) => password = data,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                }
                                if (value.length < 6) {
                                  return "Password must be at least 6 characters";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            CustomTextField(
                              hintText: 'Confirm Password',
                              icon: Icons.lock,
                              obscure: true,
                              onChanged: (data) => confirmPassword = data,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please confirm your password";
                                }
                                if (value != password) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
      
                            const SizedBox(height: 30),
                            CustomButton(
                              text: 'Sign Up',
                              onTap: () async {
                                if (formKey.currentState!.validate()) {

                                  setState(() {
                                    isLoading = true;
                                  });
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                          email: email!,
                                          password: password!,
                                        );
      
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Account created successfully",
                                        ),
                                      ),
                                    );
      
                                    Navigator.pop(context);

                                  } on FirebaseAuthException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Error: ${e.message ?? "Something went wrong"}",
                                        ),
                                      ),
                                    );
                                  }
      
                                  setState(() {
                                    isLoading = false;
                                  });

                                }
                              },
                            ),
                          ],
                        ),
                      ),
      
                      const SizedBox(height: 25),
                      CustomTextAction(
                        questionText: "Already have an account? ",
                        actionText: "Login",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
