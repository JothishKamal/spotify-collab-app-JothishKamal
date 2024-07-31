import 'package:flutter/material.dart';

class RecentCard extends StatelessWidget {
  const RecentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98,
      height: 130,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff4d5350),
            Color(0xff2f2e27),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
    );
  }
}
