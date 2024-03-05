import 'dart:math';

import 'package:coin_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:string_validator/string_validator.dart';

import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles/text_field_style.dart';
import '../../../../di.dart';
import '../../../product/presentation/page/landing_page.dart';
import '../../domain/usecase/signup_use_case.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passController2 = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(sl(), sl()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingState) {
              loadingDialog(context);
              FocusManager.instance.primaryFocus?.unfocus();
            }
            if (state is AuthSuccessState) {
              pop();
              pushToNextScreen(
                  child: const BaseView(), name: BaseView.routeName);
            }

            if (state is AuthErrorState) {
              pop();
              AppToast.showErrorToast(context: context, text: state.message);
            }
          },
          builder: (context, state) {
            return SizedBox.fromSize(
              size: MediaQuery.sizeOf(context),
              child: Stack(
                children: [
                  Positioned(
                    right: (MediaQuery.sizeOf(context).width / 2) - 150,
                    top: 60,
                    child: Transform.rotate(
                      angle: -pi * 0,
                      child: SvgPicture.asset(
                        'assets/svgs/medition_with_box.svg',
                        width: 300,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   right: 10,
                  //   top: 300,
                  //   child: Transform.rotate(
                  //     angle: -pi * 0.1,
                  //     child: Image.asset(
                  //       'assets/pngs/drugs.png',
                  //       width: 80,
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    right: 100,
                    bottom: 30,
                    child: Transform.rotate(
                      angle: -pi * 0.04,
                      child: Image.asset(
                        'assets/pngs/cardiogram.png',
                        width: 200,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    right: 30,
                    bottom: 30,
                    // padding: const EdgeInsets.all(30),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.white.withOpacity(.8),
                      ),
                      child: Form(
                        key: fKey,
                        child: Column(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sign up',
                              style: TextStyle(
                                color: AppColor.primaryHighContrast,
                                fontSize: 27,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your mail";
                                } else if (!isEmail(value)) {
                                  return "Please enter a valid mail";
                                }
                                return null;
                              },
                              style: textFieldTextStyle(),
                              decoration: textFieldDecoration('Email'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your name";
                                } else if (value.length < 4) {
                                  return "Name must have at least 4 chars";
                                }
                                return null;
                              },
                              style: textFieldTextStyle(),
                              decoration: textFieldDecoration('Full Name'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                      obscureText: true,
                                      controller: _passController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter your password";
                                        } else if (value.length < 6) {
                                          return "Password must have at least 6 chars";
                                        }
                                        return null;
                                      },
                                      style: textFieldTextStyle(),
                                      decoration:
                                          textFieldDecoration('Password')),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _passController2,
                                    validator: (value) {
                                      if (value != _passController.text) {
                                        return "Password did'nt matched";
                                      }
                                      return null;
                                    },
                                    style: textFieldTextStyle(),
                                    decoration:
                                        textFieldDecoration('Re-Password'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColor.primaryColor,
                                  foregroundColor: AppColor.white,
                                ),
                                onPressed: () async {
                                  if(fKey.currentState!.validate() && _passController.text ==
                                      _passController2.text){
                                    context.read<AuthBloc>().add(SignupEvent(
                                        data: SignupParams(
                                            email: _emailController.text.trim(),
                                            password: _passController.text.trim(),
                                            fulname: _nameController.text)));
                                  }else{
                                    AppToast.showErrorToast(context: context, text: "Password mismatch");
                                  }
                                },
                                child: const Text("Create account"),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Text(
                                  ' have an account?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColor.primaryDark,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2.5,
                                ),
                                InkWell(
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    widget.controller.animateToPage(0,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  },
                                  child: Text(
                                    'Log In ',
                                    style: TextStyle(
                                      color: AppColor.primaryHighContrast,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
