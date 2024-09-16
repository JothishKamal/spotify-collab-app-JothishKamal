import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_collab_app/view/widgets/background_widget.dart';

class JoinScreen extends ConsumerWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundWidget(
            width: width,
            height: height,
            color: Colors.white.withOpacity(0.35),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios),
                      color: const Color(0xff5822EE),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'join Event',
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          shadows: <Shadow>[
                            Shadow(
                              color: Color(0xffDA84FE),
                              offset: Offset(0, 2),
                            ),
                          ],
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      const Text(
                        'event link:',
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: height * 0.045,
                            child: TextField(
                              style: const TextStyle(
                                fontFamily: 'Gotham',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: (height * 0.045 - 32) / 2,
                                    horizontal: 10),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5822EE),
                                  ),
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(width: 10),
                          ElevatedButton(
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
                                  horizontal: 2.5, vertical: 2.5),
                              child: Text(
                                'copy link',
                                style: TextStyle(
                                  fontFamily: 'Gotham',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Divider(
                                color: Colors.white.withOpacity(0.5),
                                thickness: 1,
                              ),
                            ),
                          ),
                          Text(
                            'or',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Divider(
                                color: Colors.white.withOpacity(0.5),
                                thickness: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        width: double.infinity,
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
                                horizontal: 2.5, vertical: 2.5),
                            child: Text(
                              'generate qr',
                              style: TextStyle(
                                fontFamily: 'Gotham',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
