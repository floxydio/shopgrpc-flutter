import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopprotoflutter/bloc/auth/login/login_cubit.dart';
import 'package:shopprotoflutter/bloc/auth/login/login_event.dart';
import 'package:shopprotoflutter/config/color_constant.dart';
import 'package:shopprotoflutter/config/font_style_constant.dart';
import 'package:shopprotoflutter/presentation/auth/screens/auth_register.dart';
import 'package:shopprotoflutter/presentation/home/screens/home.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginEvent>(
          listener: (context, state) {
            if (state.statusLogin == 'success') {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            } else if (state.statusLogin == 'failed') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.responseMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Login',
                              style: FontPoppins.fontLarge
                                  .copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Text('Please sign in to continue',
                              style: FontPoppins.font16.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 24),
                          TextFormField(
                            onChanged: (v) => {
                              setState(() {
                                context.read<LoginCubit>().updateEmail(v);
                              })
                            },
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(113, 0, 0, 0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(113, 0, 0, 0),
                                  ),
                                ),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(113, 0, 0, 0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                hintText: 'john.doe@gmail.com',
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            onChanged: (v) => {
                              setState(() {
                                context.read<LoginCubit>().updatePassword(v);
                              })
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(113, 0, 0, 0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(113, 0, 0,
                                        0), // Transparent border color when focused
                                  ),
                                ),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(113, 0, 0, 0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                hintText: '******',
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 24),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 140,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<LoginCubit>().submit();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConfig.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Login',
                                  style: FontPoppins.font18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: FontPoppins.font16.copyWith(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: FontPoppins.font16.copyWith(
                                color: ColorConfig.primaryColor,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.pushNamed(context, '/register');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthRegisterPage()));
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
