import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Stack(
        children: [
          Positioned(
            left: width * 0.3,
            child: SvgPicture.asset(
              'assets/login_bg/Union.svg',
              colorFilter: ColorFilter.mode(
                color,
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
                color,
                BlendMode.modulate,
              ),
            ),
          ),
          Positioned(
            top: height * 0.45,
            child: SvgPicture.asset(
              'assets/login_bg/Union-2.svg',
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.modulate,
              ),
            ),
          ),
          Positioned(
            top: height * 0.05,
            child: SvgPicture.asset(
              'assets/login_bg/Union-3.svg',
              colorFilter: ColorFilter.mode(
                color,
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
                color,
                BlendMode.modulate,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              'assets/login_bg/Union-5.svg',
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.modulate,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              'assets/login_bg/Union-6.svg',
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.modulate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
