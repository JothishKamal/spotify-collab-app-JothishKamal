import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/view/widgets/custom_text_field.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

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
      appBar: AppBar(
        centerTitle: false,
        title: IconButton(
          onPressed: () {
            if (textFieldVisibility == 1) {
              ref.read(textFieldVisibilityProvider.notifier).state = 0;
            } else {
              context.go('/');
            }
          },
          icon: SvgPicture.asset(
            'assets/back.svg',
            colorFilter:
                const ColorFilter.mode(Color(0xff5822EE), BlendMode.srcIn),
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 1000,
            width: 1000,
            child: SvgPicture.asset(
              'assets/bg.svg',
              colorFilter:
                  const ColorFilter.mode(Color(0xffd1dfdb), BlendMode.srcIn),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.06,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'log in',
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          shadows: <Shadow>[
                            Shadow(
                              color: Color(0xffDA84FE),
                              offset: Offset(0, 2),
                            ),
                          ],
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (textFieldVisibility == 0) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: height * 0.025,
                    ),
                    child: CustomTextField(
                      textEditingController: emailController,
                      labelText: 'whats your email?',
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
                          labelText: 'password',
                          obscureText: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.01),
                          child: const Text(
                            'forgot password?',
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
