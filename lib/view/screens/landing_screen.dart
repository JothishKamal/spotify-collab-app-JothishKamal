// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xff5822EE),
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
                    colorFilter: const ColorFilter.mode(
                      const Color(0xffd056fc),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.27,
                  left: width * 0.6,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-1.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xffd056fc),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.45,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-2.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xffd056fc),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.05,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-3.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xffd056fc),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.45,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-4.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xffd056fc),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-5.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xffd056fc),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/login_bg/Union-6.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xffd056fc),
                      BlendMode.modulate,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Center(
                child: Text(
                  'collabify',
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    shadows: <Shadow>[
                      Shadow(
                        color: Color(0xffDA84FE),
                        offset: Offset(0, 2),
                      ),
                    ],
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.0),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    const Color(0xff111111),
                  ),
                ),
                onPressed: () => context.go('/signup'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                  child: Text(
                    'Not a member? Sign up',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(0),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.0),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),
                ),
                onPressed: () => context.go('/login'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16,
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              )
            ],
          ),
        ],
      ),
    );
  }
}
