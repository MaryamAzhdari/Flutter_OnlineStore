import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/controllers/auth_controller.dart';
import 'package:online_store/views/custom_widgets/auth_top_part.dart';
import 'package:online_store/views/custom_widgets/custom_button.dart';
import 'package:online_store/views/screens/authentication/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;
  late String fullName;
  late String password;
   bool isLoading = false;
  signUpUser() async {
    setState(() {
      isLoading = true;
    });
    await _authController
        .signUpUsers(
            context: context,
            fullName: fullName,
            email: email,
            password: password)
        .whenComplete(() {
      _formKey.currentState!.reset();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthTopPart(
                        title: 'Create your account',
                        sunTitle: 'To explore the world exclusives',
                        imgPath: 'assets/images/login.png'),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email",
                          style: GoogleFonts.getFont('Nunito Sans',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                              fontSize: 14)),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your email';
                        } else {
                          return null;
                        }
                      },
                      initialValue: 'test@gmail.com',
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter your email',
                          labelStyle: GoogleFonts.getFont('Nunito Sans',
                              fontSize: 14, letterSpacing: 0.1),
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            size: 20,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("FullName",
                          style: GoogleFonts.getFont('Nunito Sans',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                              fontSize: 14)),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        fullName = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your full name';
                        } else {
                          return null;
                        }
                      },
                      initialValue: 'test',
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter your FullName',
                          labelStyle: GoogleFonts.getFont('Nunito Sans',
                              fontSize: 14, letterSpacing: 0.1),
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            size: 20,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Password",
                          style: GoogleFonts.getFont('Nunito Sans',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                              fontSize: 14)),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your password';
                        } else {
                          return null;
                        }
                      },
                      initialValue: 'test_test_',
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter your password',
                          labelStyle: GoogleFonts.getFont('Nunito Sans',
                              fontSize: 14, letterSpacing: 0.1),
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                            size: 20,
                          ),
                          suffixIcon: const Icon(Icons.remove_red_eye)),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Custom_Button(
                          onTap: () {
                          if (_formKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                          title: 'Sign up',
                          isLoading: isLoading,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already you have an account',
                            style: GoogleFonts.getFont(
                              'Nunito Sans',
                              color: const Color.fromARGB(255, 60, 59, 59),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.2,
                              fontSize: 14,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          },
                          child: Text(
                            'Login',
                            style: GoogleFonts.getFont(
                              'Nunito Sans',
                              color: const Color.fromARGB(255, 17, 1, 195),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.2,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
