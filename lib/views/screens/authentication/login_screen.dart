import 'package:flutter/material.dart';
import 'package:online_store/controllers/auth_controller.dart';
import 'package:online_store/theme.dart';
import 'package:online_store/views/widgets/custom_widgets/auth_top_part.dart';
import 'package:online_store/views/widgets/custom_widgets/custom_button.dart';
import 'package:online_store/views/screens/authentication/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //set for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;
  late String password;
  bool isLoading = false;
  loginUser() async {
    setState(() {
      isLoading = true;
    });
    await _authController
        .signInUsers(context: context, email: email, password: password)
        .whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //final themeData = Theme.of(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
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
                          style: Theme.of(context).textTheme.titleMedium),
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
                          fillColor: AppTheme.mcTextFormFieldBackColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter your email',
                          labelStyle: Theme.of(context).textTheme.titleSmall,
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
                          style: Theme.of(context).textTheme.titleMedium),
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
                          fillColor: AppTheme.mcTextFormFieldBackColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter your password',
                          labelStyle: Theme.of(context).textTheme.titleSmall,
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
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                loginUser();
                              }
                            },
                            title: 'Login',
                            isLoading: isLoading,
                          )

                          // InkWell(
                          //     onTap: () {
                          //       if (_formKey.currentState!.validate()) {
                          //         loginUser();
                          //       }
                          //     },
                          //     child: Custom_Button(
                          //       title: 'Login',
                          //       isLoading: isLoading,
                          //     ))
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('You need an account',
                            style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SignupScreen();
                            }));
                          },
                          child: Text('Sign up',
                              style: Theme.of(context).textTheme.labelMedium),
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
