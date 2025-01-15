import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_collab_app/providers/admin_screen_provider.dart';
import 'package:spotify_collab_app/providers/playlist_provider.dart';
import 'package:spotify_collab_app/view/models/songs_response.dart' as songs;
import 'package:spotify_collab_app/view/widgets/music_list_item.dart';

class AdminScreen extends ConsumerStatefulWidget {
  const AdminScreen({super.key});

  @override
  ConsumerState<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends ConsumerState<AdminScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _fetchSongs();
    final initialIndex = ref.read(tabProvider);
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: initialIndex);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        ref.read(tabProvider.notifier).state = _tabController.index;
      }
    });
  }

  Future<void> _fetchSongs() async {
    final playlistNotifier = ref.read(playlistProvider.notifier);
    final songsNotifier = ref.read(songsProvider.notifier);

    try {
      await songsNotifier.fetchSongs(playlistNotifier.selectedPlaylistUuid!);
    } catch (e) {
      log(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    final currentIndex = ref.watch(tabProvider);
    final requestAction = ref.watch(requestActionProvider);
    final songsData = ref.watch(songsProvider);

    if (_tabController.index != currentIndex) {
      _tabController.animateTo(currentIndex);
    }

    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xff5822EE),
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: IconButton(
              onPressed: () {
                context.pop();
              },
              iconSize: 16,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xffD1D2D9),
              ),
            ),
            actions: [
              (GoRouterState.of(context).extra as Map<String, dynamic>)['owner']
                  ? IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete Playlist'),
                            content: const Text(
                                'Are you sure you want to delete this playlist?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final status = await ref
                                      .read(playlistProvider.notifier)
                                      .deletePlaylist(ref
                                          .read(playlistProvider.notifier)
                                          .selectedPlaylistUuid!);

                                  if (!context.mounted) return;

                                  switch (status) {
                                    case DeleteStatus.success:
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Playlist deleted successfully',
                                            style: TextStyle(
                                              fontFamily: 'Gotham',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      context.pop();
                                      context.pop();
                                      break;
                                    case DeleteStatus.failure:
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Failed to delete playlist',
                                            style: TextStyle(
                                              fontFamily: 'Gotham',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      context.pop();
                                      break;
                                    case DeleteStatus.error:
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Error occurred while deleting playlist',
                                            style: TextStyle(
                                              fontFamily: 'Gotham',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      context.pop();
                                      break;
                                  }
                                },
                                child: const Text('Delete',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const SizedBox.shrink()
            ],
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.03,
                  left: height * 0.03,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    ref.watch(playlistProvider.notifier).selectedPlaylistName!,
                    style: const TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 45,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.12),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(
                    12,
                    13,
                    14,
                    1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    TabBar(
                      controller: _tabController,
                      indicatorColor: const Color(0xffF674A2),
                      labelColor: Colors.white,
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(
                          child: Text(
                            "Playlist",
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Requests",
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Color(0xffCCCCCC),
                      height: 1,
                    ),
                    Expanded(
                      child: (_isLoading)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : TabBarView(
                              controller: _tabController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                buildTabContent(
                                  songsData.data!.accepted!,
                                  isPlaylist: true,
                                ),
                                buildRequestTabContent(
                                  songsData.data!.submitted!,
                                  requestAction,
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            margin: EdgeInsets.only(top: height * 0.12),
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/bg_admin.svg',
              colorFilter:
                  const ColorFilter.mode(Color(0xffd1dfdb), BlendMode.srcIn),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTabContent(List<songs.Accepted> items,
      {bool isPlaylist = false,
      bool isRequest = false,
      bool isParticipant = false}) {
    return (items.isEmpty)
        ? const Center(
            child: Text(
              "No songs in playlist.",
              style: TextStyle(
                fontFamily: 'Gotham',
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          )
        : Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Color(0xFFCCCCCC),
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return isPlaylist
                          ? MusicListItem(
                              id: item.track!.track!.id!,
                              title: item.track!.track!.name!,
                              subtitle: item.track!.track!.artists!
                                  .map((artist) => artist.name!)
                                  .join(', '),
                              imageUrl:
                                  item.track!.track!.album!.images![0].url!,
                              isPlaylist: isPlaylist,
                              isRequest: isRequest,
                              isParticipant: isParticipant,
                            )
                          : MusicListItem(
                              id: item.track!.track!.id!,
                              title: item.track!.track!.album!.name!,
                              subtitle: null,
                              imageUrl: null,
                              isPlaylist: isPlaylist,
                              isRequest: isRequest,
                              isParticipant: isParticipant,
                            );
                    },
                  ),
                ),
              ],
            ),
          );
  }

  Widget buildRequestTabContent(
      List<songs.Submitted> items, RequestAction action) {
    return (items.isEmpty)
        ? const Center(
            child: Text(
              "No requests",
              style: TextStyle(
                fontFamily: 'Gotham',
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  itemCount: items.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(0xFFCCCCCC),
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return MusicListItem(
                      id: item.id!,
                      title: item.name!,
                      subtitle: item.artists!
                          .map((artist) => artist.name!)
                          .join(', '),
                      imageUrl: item.album!.images![0].url!,
                      isRequest: true,
                    );
                  },
                ),
              ),
            ],
          );
  }
}
