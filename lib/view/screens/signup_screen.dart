import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/view/widgets/background_widget.dart';
import 'package:spotify_collab_app/view/widgets/u_custom_text_field.dart';

final textFieldVisibilityProvider = StateProvider<int>((ref) => 0);

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    final textFieldVisibility = ref.watch(textFieldVisibilityProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundWidget(
            width: width,
            height: height,
            color: Colors.white.withOpacity(.5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.06,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (textFieldVisibility == 1) {
                          ref.read(textFieldVisibilityProvider.notifier).state =
                              0;
                        } else {
                          context.go('/');
                        }
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: const Color(0xff5822EE),
                    ),
                    SizedBox(
                      width: width * 0.25,
                    ),
                    const Text(
                      'sign up',
                      style: TextStyle(
                        fontFamily: 'Gotham',
                        shadows: <Shadow>[
                          Shadow(
                            color: Color(0xffDA84FE),
                            offset: Offset(0, 2),
                          ),
                        ],
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                if (textFieldVisibility == 0) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: height * 0.025,
                    ),
                    child: CustomTextField(
                      textEditingController: emailController,
                      labelText: 'Whats your email?',
                      obscureText: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            const Color(0xff5822EE),
                          ),
                        ),
                        onPressed: () {
                          ref.read(textFieldVisibilityProvider.notifier).state =
                              1;
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ] else if (textFieldVisibility == 1) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: height * 0.025,
                    ),
                    child: CustomTextField(
                      textEditingController: passwordController,
                      labelText: 'Password',
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.05,
                      right: width * 0.05,
                      bottom: height * 0.025,
                    ),
                    child: CustomTextField(
                      textEditingController: confirmPasswordController,
                      labelText: 'Confirm Password',
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            const Color(0xff5822EE),
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
