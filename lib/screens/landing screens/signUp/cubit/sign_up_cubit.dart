import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:bloc/bloc.dart';
import 'package:e_com_project_new/screens/landing%20screens/signUp/model/signIn_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../custom/custom_widgets.dart';
import '../../login/logIn_screen.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  saveToken(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Token', value);
  }

  Future<void> postData(BuildContext context, SignUpModel signUpModel) async {
    String url = "https://www.infusevalue.live/api/v1/auth/register";

    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signUpModel.toJson()));

    if (response.statusCode == 200) {
      print('Data Send Success');
      print(response.body);
      saveToken(response.body);
      custom_snakeBar(
          context, 'Success', 'User Successfully Created', ContentType.success);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogInScreen(),
        ),
      );
    } else {
      print('Data not send');
      print(response.statusCode);
      custom_snakeBar(context, response.statusCode.toString(), response.body,
          ContentType.failure);
    }
  }
}
