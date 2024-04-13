import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_com_project_new/custom/custom_styles.dart';
import 'package:e_com_project_new/screens/landing%20screens/signUp/model/signIn_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_theme/theme.dart';
import '../../../custom/custom_scaffold.dart';
import '../../../custom/custom_widgets.dart';
import '../login/logIn_screen.dart';
import 'cubit/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          custom_snakeBar(context, 'ohh Snap!!', 'SomeThing Went Wrong',
              ContentType.warning);
        } else if (state is SignUpError) {
          custom_snakeBar(context, 'ohh Snap!!', 'SomeThing Went Wrong',
              ContentType.warning);
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
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
                  height: 5,
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
                    // get started form
                    child: Form(
                      key: _formSignupKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // get started text
                          Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          // full name
                          Row(
                            children: [
                              SizedBox(
                                  width: 160,
                                  child: textFormField(
                                      controller: firstController, (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter First name';
                                    }
                                    return null;
                                  }, 'First Name', 'Enter First Name')),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                  width: 160,
                                  child: textFormField((value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Last name';
                                    }
                                    return null;
                                  }, 'Last Name', 'Enter Last Name',
                                      controller: lastController)),
                            ],
                          ),

                          const SizedBox(
                            height: 25.0,
                          ),
                          // email
                          textFormField((value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }
                            return null;
                          }, 'Email', 'Enter Email',
                              controller: emailController),

                          const SizedBox(
                            height: 25.0,
                          ),
                          // password
                          textFormField(
                              controller: passController,
                              is_password: true, (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          }, 'Password', 'Enter Password'),

                          const SizedBox(
                            height: 25.0,
                          ),
                          //phoneNumber
                          textFormField(controller: phoneController, (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Phone';
                            }
                            return null;
                          }, 'Phone', 'Enter Phone'),

                          const SizedBox(
                            height: 25.0,
                          ),
                          // i agree to the processing
                          Row(
                            children: [
                              Checkbox(
                                value: agreePersonalData,
                                onChanged: (bool? value) {
                                  setState(() {
                                    agreePersonalData = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary,
                              ),
                              Text('I agree to the processing of ',
                                  style: mtextStyle15()),
                              Text(
                                'Personal data',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: lightColorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          // signup button
                          elevatedButton(text: 'Sign Up', () {
                            if (_formSignupKey.currentState!.validate() &&
                                agreePersonalData) {
                              context
                                  .read<SignUpCubit>()
                                  .postData(
                                      context,
                                      SignUpModel(
                                        firstName:
                                            firstController.text.toString(),
                                        email: emailController.text.toString(),
                                        lastName:
                                            lastController.text.toString(),
                                        password:
                                            passController.text.toString(),
                                        phone: phoneController.text.toString(),
                                      ))
                                  .then((value) => custom_snakeBar(
                                      context,
                                      'Wait!!',
                                      'Prossing Data Please Wait',
                                      ContentType.warning));
                            } else if (!agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please agree to the processing of personal data')),
                              );
                            }
                          }),
                          const SizedBox(
                            height: 30.0,
                          ),

                          // already have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account? ',
                                  style: mtextStyle15()),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
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
