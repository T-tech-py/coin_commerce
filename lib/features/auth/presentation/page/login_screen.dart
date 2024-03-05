import 'dart:math';

import 'package:coin_commerce/features/auth/domain/entity/login_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coin_commerce/core/shared/custom_image_widget.dart';
import 'package:coin_commerce/core/utils/app_navigator.dart';
import 'package:coin_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../../../../core/utils/app_toast.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles/text_field_style.dart';
import '../../../../di.dart';
import '../../../product/presentation/page/landing_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.controller});
  static const routeName = '/loginScreen';
  final PageController controller;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                    right: 40,
                    top: 140,
                    child: Transform.rotate(
                      angle: pi * .1,
                      child: const CustomImageWidget(
                        imagePath: 'assets/images/basket.png',
                        width: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 80,
                    top: 300,
                    child: Transform.rotate(
                      angle: -pi * 0.05,
                      child: const CustomImageWidget(
                        imagePath: 'assets/images/package.png',
                        width: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 20,
                    child: Transform.rotate(
                      angle: -pi * 0.14,
                      child: const CustomImageWidget(
                        imagePath: 'assets/images/cart.png',
                        width: 120,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 3,
                    top: 10,
                    child: CustomImageWidget(
                      width: 200,
                      imagePath: 'assets/images/online_shopping.png',
                    ),
                  ),
                  Positioned(
                    // padding: const EdgeInsets.all(30),
                    bottom: 30,
                    left: 30,
                    right: 30,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.white.withOpacity(.8),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          // padding: const EdgeInsets.symmetric(horizontal: 50),
                          children: [
                            const Text(
                              'Log In',
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your e-mail/username.";
                                }
                                // else if (!isEmail(value)) {
                                //   return "Invalid mail";
                                // }
                                return null;
                              },
                              controller: _emailController,
                              style: textFieldTextStyle(),
                              decoration: textFieldDecoration('Email'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter you password";
                                } else if (value.length < 6) {
                                  return "Must have at least 6 chars";
                                }
                                return null;
                              },
                              focusNode: FocusNode(
                                canRequestFocus: true,
                              ),
                              controller: _passController,
                              style: textFieldTextStyle(),
                              decoration: textFieldDecoration('Password'),
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
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthBloc>().add(LoginEvent(
                                          data: LoginRequest(
                                              username: _emailController.text,
                                              password: _passController.text)));
                                    }
                                  },
                                  child: const Text("Sign In")),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Don’t have an account?',
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
                                    widget.controller.animateToPage(1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: AppColor.primaryHighContrast,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // const Text(
                            //   'Forget Password?',
                            //   style: TextStyle(
                            //     color: AppColor.primaryHighContrast,
                            //     fontSize: 13,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
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
