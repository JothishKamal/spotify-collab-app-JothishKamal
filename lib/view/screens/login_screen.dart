import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/view/widgets/u_custom_text_field.dart';

final textFieldVisibilityProvider = StateProvider<int>((ref) => 0);

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    final textFieldVisibility = ref.watch(textFieldVisibilityProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IgnorePointer(
            ignoring: true,
            child: Stack(
              children: [
                Positioned(
                  left: width * 0.3,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.25),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.27,
                  left: width * 0.6,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-1.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.25),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.45,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-2.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.25),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.05,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-3.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.25),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.45,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-4.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.25),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-5.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.25),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-6.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.25),
                      BlendMode.modulate,
                    ),
                  ),
                ),
              ],
            ),
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
                      width: width * 0.27,
                    ),
                    const Text(
                      'log in',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          textEditingController: passwordController,
                          labelText: 'Password',
                          obscureText: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.01),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 11,
                              fontWeight: FontWeight.w200,
                              color: Color(0xffffffff),
                            ),
                          ),
                        )
                      ],
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
