import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/controllers/auth_controller.dart';
import 'package:online_store/views/custom_widgets/auth_top_part.dart';
import 'package:online_store/views/custom_widgets/custom_button.dart';
import 'package:online_store/views/screens/authentication/signup_screen.dart';

//توی آموزش اصلی از نوع استیت فول هست
// ignore: must_be_immutable
class LoginScreen_Stateless extends StatelessWidget {
  //const LoginScreen({super.key});
  //set for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;
  late String password;
  bool isLoading = false;

  LoginScreen_Stateless({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          //For use Expanded in SingleChildScrollView -> you must use CustomScrollView
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthTopPart(
                        title: 'Login your account',
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
                      height: 100,
                    ),
                    Expanded(
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Custom_Button(
                            onTap: () async{
                                if (_formKey.currentState!.validate()) {
                                  await _authController.signInUsers(
                                      context: context,
                                      email: email,
                                      password: password);
                                }},
                                title: 'Login',isLoading: false,)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('You need an account',
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
                              return SignupScreen();
                            }));
                          },
                          child: Text(
                            'Sign up',
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
