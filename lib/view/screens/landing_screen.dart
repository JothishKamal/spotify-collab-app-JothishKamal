import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/view/widgets/background_widget.dart';

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
          BackgroundWidget(
            width: width,
            height: height,
            color: const Color(0xffd056fc),
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
