import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/utils/api_util.dart';
import 'package:spotify_collab_app/view/widgets/background_widget.dart';
import 'package:spotify_collab_app/view/widgets/custom_text_field.dart';
import 'package:spotify_collab_app/providers/photo_upload_notifier.dart';

class CreateScreen extends ConsumerWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    final TextEditingController eventNameController = TextEditingController();

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
                      onPressed: () => context.go('/home'),
                      icon: const Icon(Icons.arrow_back_ios),
                      color: const Color(0xff5822EE),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'new shared playlist',
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
                        height: height * 0.04,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            ref.read(photoUploadProvider.notifier).pickImage();
                          },
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: width * 0.15,
                                backgroundImage: ref
                                            .watch(photoUploadProvider) !=
                                        null
                                    ? FileImage(ref.watch(photoUploadProvider)!)
                                    : null,
                                child: ref.watch(photoUploadProvider) == null
                                    ? const Text(
                                        'Upload\n Photo',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      )
                                    : null,
                              ),
                              Positioned(
                                top: height * 0.1,
                                bottom: 0,
                                child: SvgPicture.asset(
                                  'assets/plus.svg',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.055,
                      ),
                      CustomTextField(
                        labelText: 'event name',
                        obscureText: false,
                        textEditingController: eventNameController,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Align(
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
                          onPressed: () async {
                            if (eventNameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Event name cannot be empty'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              Response<dynamic> response =
                                  await apiUtil.post('/v1/playlists', {
                                'name': eventNameController.text,
                              });
                              log(response.toString());
                              if (response.statusCode == 200) {
                                if (response.data["message"] ==
                                    "playlist successfully created") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Playlist successfully created'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  context.go('/home');
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Failed to create playlist'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5),
                            child: Text(
                              'create event',
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
