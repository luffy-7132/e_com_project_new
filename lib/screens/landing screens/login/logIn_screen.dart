import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:e_com_project_new/custom/custom_styles.dart';
import 'package:e_com_project_new/custom/custom_widgets.dart';
import 'package:e_com_project_new/screens/landing%20screens/login/cubit/login_cubit.dart';
import 'package:e_com_project_new/screens/landing%20screens/signUp/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../app_theme/theme.dart';
import '../../../custom/custom_scaffold.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          custom_snakeBar(context, 'Please Wait!!',
              'We are Processing your Data', ContentType.warning);
        } else if (state is LoginErrorState) {
          custom_snakeBar(context, 'ohh Snap!!', 'SomeThing Went Wrong',
              ContentType.warning);
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomScaffold(
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formSignInKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                          textFormField((value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }
                            return null;
                          }, 'Email', 'Enter Email',
                              controller: emailController),

                          const SizedBox(
                            height: 35.0,
                          ),
                          textFormField(is_password: true, (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          }, 'Password', 'Enter Password',
                              controller: passController),

                          const SizedBox(
                            height: 35.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberPassword,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        rememberPassword = value!;
                                      });
                                    },
                                    activeColor: lightColorScheme.primary,
                                  ),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                child: Text(
                                  'Forget password?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35.0,
                          ),
                          elevatedButton(
                            () {
                              if (_formSignInKey.currentState!.validate() &&
                                  rememberPassword) {
                                context.read<LoginCubit>().postData(
                                    emailController.text.toString(),
                                    passController.text.toString(),
                                    context);
                              } else if (!rememberPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please agree to the processing of personal data')),
                                );
                              } else {
                                context.read<LoginCubit>().postData(
                                    emailController.text.toString(),
                                    passController.text.toString(),
                                    context);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 35.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 10,
                                ),
                                child:
                                    Text('Sign up with', style: mtextStyle15()),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                LineAwesome.facebook,
                                size: 34,
                              ),
                              Icon(
                                LineAwesome.google,
                                size: 34,
                              ),
                              Icon(
                                LineAwesome.apple,
                                size: 34,
                              ),
                              Icon(
                                LineAwesome.twitter,
                                size: 34,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // don't have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?  ',
                                  style: mtextStyle15()),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (e) => const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
