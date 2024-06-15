import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopprotoflutter/bloc/auth/signup/signup_cubit.dart';
import 'package:shopprotoflutter/bloc/auth/signup/signup_event.dart';
import 'package:shopprotoflutter/config/color_constant.dart';
import 'package:shopprotoflutter/config/font_style_constant.dart';
import 'package:shopprotoflutter/presentation/auth/screens/auth_login.dart';

class AuthRegisterPage extends StatefulWidget {
  const AuthRegisterPage({super.key});

  @override
  State<AuthRegisterPage> createState() => _AuthRegisterPageState();
}

class _AuthRegisterPageState extends State<AuthRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SignUpCubit, SignUpEvent>(
          listener: (context, state) {
            if (state.statusLogin == 'success') {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const AuthLoginPage()));
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
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Register',
                              style: FontPoppins.fontLarge
                                  .copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Text('Please sign up to create account',
                              style: FontPoppins.font16.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 24),
                          TextFormField(
                            onChanged: (v) => {
                              setState(() {
                                context.read<SignUpCubit>().updateName(v);
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
                                hintText: 'John Doe',
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            onChanged: (v) => {
                              setState(() {
                                context.read<SignUpCubit>().updateEmail(v);
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
                                context.read<SignUpCubit>().updatePassword(v);
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
                          // select option
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(113, 0, 0, 0),
                                ),
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
                                  color: Color.fromARGB(113, 0, 0, 0),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            value: 'Admin',
                            items:
                                <String>['Admin', 'User'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                context
                                    .read<SignUpCubit>()
                                    .updateRole(newValue ?? "Admin");
                              });
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 140,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<SignUpCubit>().submit();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConfig.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Sign Up',
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
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 24),
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: RichText(
                //       text: TextSpan(
                //         text: 'Don\'t have an account? ',
                //         style: FontPoppins.font16.copyWith(color: Colors.grey),
                //         children: <TextSpan>[
                //           TextSpan(
                //             text: 'Sign Up',
                //             style: FontPoppins.font16.copyWith(
                //                 color: ColorConfig.primaryColor,
                //                 fontWeight: FontWeight.bold),
                //             recognizer: TapGestureRecognizer()
                //               ..onTap = () {
                //                 // Navigator.pushNamed(context, '/register');
                //               },
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
