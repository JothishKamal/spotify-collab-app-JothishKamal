import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            fontFamily: "Gotham",
            fontWeight: FontWeight.w700,
            fontSize: 34,
            shadows: <Shadow>[
              Shadow(offset: Offset(0, 1), color: Color(0xffDA84FE)),
            ],
          ),
        ),
        Column(
          children: [
            SvgPicture.asset('assets/highlight.svg'),
            const SizedBox(height: 30),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
