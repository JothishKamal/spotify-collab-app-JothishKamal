import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color.fromARGB(255, 128, 33, 21), Color(0xff646B35)])),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffC14231)),
              ),
              const SizedBox(width: 8),
              const Text(
                "From Me to You - Mono / Remastered",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffB2B2B2),
              backgroundColor: const Color.fromARGB(255, 128, 33, 21),
            ),
          ),
        )
      ]),
    );
  }
}
