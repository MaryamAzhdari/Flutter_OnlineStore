import 'package:flutter/material.dart';
import 'package:online_store/controllers/auth_controller.dart';
import 'package:online_store/theme.dart';
import 'package:online_store/views/widgets/custom_widgets/auth_top_part.dart';
import 'package:online_store/views/widgets/custom_widgets/custom_button.dart';
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
      // appBar: AppBar(
      //   title: const Text('Sign up'),
      // ),
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
                          fillColor:  AppTheme.mcTextFormFieldBackColor,
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
                      child: Text("FullName",
                          style: Theme.of(context).textTheme.titleMedium),
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
                          fillColor:  AppTheme.mcTextFormFieldBackColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter your FullName',
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
                            style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                          },
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.labelMedium
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
