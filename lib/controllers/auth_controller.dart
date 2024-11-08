import 'dart:convert';
import 'package:online_store/global_variable.dart';
import 'package:online_store/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:online_store/services/manage_http_response.dart';

class AuthController {
  Future<void> signUpUsers(
      {required context,
      required String fullName,
      required String email,
      required String password}) async {
    try {
      User user = User(
          id: '',
          fullName: fullName,
          email: email,
          password: password,
          state: '',
          city: '',
          locality: '',
          token: '');

      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user
              .toJson(), //Convert the user object to json for the request body
          headers: <String, String>{
            'Content-Type':
                'application/json; charset=UTF-8', //specify the context type as json
          });
      //print('$uri/api/signup');
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account has been created for you');
          });
    } catch (e) {
      print("Error : $e");
    }
  }

  //Signin users function
  Future<void> signInUsers(
      {required context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode(
            {'email': email, 'password': password},
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      manageHttpResponse(
          response: response, context: context, onSuccess: () {
            showSnackBar(context, 'Logged In');
          });
    } catch (e) {
      print("Error : $e");
    }
  }
}
