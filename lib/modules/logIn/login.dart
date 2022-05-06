import 'package:conditional/conditional.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/modules/home_layout/home_layout.dart';
import 'package:shop_app/modules/logIn/cubit/login_cubit.dart';
import 'package:shop_app/modules/logIn/cubit/login_states.dart';
import 'package:shop_app/modules/register/register_screen.dart';
import 'package:shop_app/shared/components/component.dart';
import 'package:shop_app/shared/network/shared_prefernce.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            print('${state.loginModel.status}');
            if (state.loginModel.status) {
              SharedPreference.putData('token', state.loginModel.data!.token)
                  .then((value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeLayout()),
                    (route) => false);
              });
            } else {
              print('${state.loginModel.message}');
              Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Black and Violet',
                              fontWeight: FontWeight.bold,
                              fontSize: 60),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('login to browse our hot offers',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Black and Violet',
                                fontSize: 35)),
                        SizedBox(
                          height: 15.0,
                        ),
                        textFormFieldFormat(
                            validation: (String value) {
                              if (value.isEmpty) {
                                return 'You have to enter your email address';
                              }
                            },
                            controller: emailController,
                            label: 'Email Address',
                            prefix: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress),
                        SizedBox(
                          height: 15.0,
                        ),
                        textFormFieldFormat(
                            validation: (String value) {
                              if (value.isEmpty) {
                                return 'You have to enter your email address';
                              }
                            },
                            controller: passwordController,
                            label: 'Password',
                            prefix: Icons.lock_outline,
                            keyboardType: TextInputType.visiblePassword,
                            suffix: LoginCubit.get(context).sufixiIcon,
                            obscure: LoginCubit.get(context).isVisibale,
                            suffixPressed: () {
                              LoginCubit.get(context)
                                  .changePasswordVisibility();
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        Conditional(
                          condition: state is! LoginLoadingState,
                          onConditionFalse: Center(
                            child: CircularProgressIndicator(),
                          ),
                          onConditionTrue: MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                    emailController.text,
                                    passwordController.text);
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            minWidth: double.infinity,
                            height: 50.0,
                            color: Colors.lightBlue,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(fontFamily: 'NewFont'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterScreen()),
                                  );
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.lightBlue),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
