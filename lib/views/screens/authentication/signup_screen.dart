import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/views/screens/authentication/login_screen.dart';

class SignupScreen extends StatelessWidget {
  //const SignupScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up'),),
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
                    Text("Create your account",
                        style: GoogleFonts.getFont('Lato',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
                            fontSize: 23)),
                    Text("To explore the world exclusives",
                        style: GoogleFonts.getFont('Lato',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
                            fontSize: 14)),
                    Image.asset(
                      'assets/images/login.png',
                      width: 300,
                      height: 300,
                    ),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your email';
                        } else {
                          return null;
                        }
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your full name';
                        } else {
                          return null;
                        }
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your password';
                        } else {
                          return null;
                        }
                      },
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
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              print('correct');
                            } else {
                              print('failed');
                            }
                          },
                          child: Container(
                              width: 320,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 2, 48, 98),
                                      Color.fromARGB(255, 105, 116, 144),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 280,
                                      top: 20,
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 12,
                                                  color: const Color.fromARGB(
                                                      255, 49, 157, 220)),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      )),
                                  Positioned(
                                      left: 250,
                                      top: 30,
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 3,
                                                  color: const Color.fromARGB(
                                                      255, 49, 157, 220)),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      )),
                                  Positioned(
                                      left: 300,
                                      top: 25,
                                      child: Opacity(
                                        opacity: 0.3,
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      )),
                                  Positioned(
                                      left: 280,
                                      top: -7,
                                      child: Opacity(
                                        opacity: 0.3,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      )),
                                  Center(
                                    child: Text(
                                      'Sign up',
                                      style: GoogleFonts.getFont(
                                        'Nunito Sans',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.2,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                              )),
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
                    const SizedBox(height: 30,)
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
