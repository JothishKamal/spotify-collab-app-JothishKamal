import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_collab_app/providers/admin_screen_provider.dart';

class AdminScreen extends ConsumerStatefulWidget {
  const AdminScreen({super.key});

  @override
  ConsumerState<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends ConsumerState<AdminScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final initialIndex = ref.read(tabProvider);
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: initialIndex);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        ref.read(tabProvider.notifier).state = _tabController.index;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    final currentIndex = ref.watch(tabProvider);
    final requestAction = ref.watch(requestActionProvider);

    final List<Map<String, String>> items = [
      {
        "title": "One of Wun",
        "subtitle": "Gunna",
        "imageUrl": "assets/OneOfWun.png",
      },
      {
        "title": "Chanel",
        "subtitle": "Frank Ocean",
        "imageUrl": "assets/Chanel.png",
      },
    ];

    final participants = [
      "Souvik",
      "Jothish",
      "Aakaash",
      "Aditya",
      "Karan",
    ];
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
              onPressed: () {},
              iconSize: 16,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xffD1D2D9),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                iconSize: 16,
                icon: const Icon(
                  Icons.more_vert,
                  color: Color(0xffD1D2D9),
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.03,
                ),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "DevJams’ 24",
                    style: TextStyle(
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
                  color: Color.fromRGBO(12, 13, 14, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.138),
                      child: TabBar(
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
                          ),
                          Tab(
                            child: Text(
                              "Participants",
                              style: TextStyle(
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffCCCCCC),
                      height: 1,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          buildTabContent(items, isPlaylist: true),
                          buildRequestTabContent(items, requestAction),
                          buildTabContent(participants, isParticipant: true),
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
        Positioned(
          right: width * 0.05,
          top: height * 0.1,
          child: SvgPicture.asset('assets/path.svg'),
        )
      ],
    );
  }

  Widget buildTabContent(List<dynamic> items,
      {bool isPlaylist = false,
      bool isRequest = false,
      bool isParticipant = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          if (isParticipant)
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Total Participants - ${items.length}',
                style: const TextStyle(
                  fontFamily: 'Gotham',
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            )
          else
            const SizedBox(),
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
                        title: item["title"]!,
                        subtitle: item["subtitle"]!,
                        imageUrl: item["imageUrl"]!,
                        isPlaylist: isPlaylist,
                        isRequest: isRequest,
                        isParticipant: isParticipant,
                      )
                    : MusicListItem(
                        title: item!,
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
      List<Map<String, String>> items, RequestAction action) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<RequestAction>(
                value: RequestAction.rejectAll,
                groupValue: action,
                onChanged: (value) =>
                    ref.read(requestActionProvider.notifier).state = value!,
                activeColor: Colors.red,
                fillColor: const WidgetStatePropertyAll(Colors.red),
              ),
              const Text(
                "Reject All",
                style: TextStyle(
                  fontFamily: 'Gotham',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
              Radio<RequestAction>(
                value: RequestAction.acceptAll,
                groupValue: action,
                onChanged: (value) =>
                    ref.read(requestActionProvider.notifier).state = value!,
                activeColor: Colors.green,
                fillColor: const WidgetStatePropertyAll(Colors.green),
              ),
              const Text(
                "Accept All",
                style: TextStyle(
                  fontFamily: 'Gotham',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            itemCount: items.length,
            separatorBuilder: (context, index) => const Divider(
              color: Color(0xFFCCCCCC),
              height: 1,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return MusicListItem(
                title: item["title"]!,
                subtitle: item["subtitle"]!,
                imageUrl: item["imageUrl"]!,
                isRequest: true,
              );
            },
          ),
        ),
      ],
    );
  }
}

class MusicListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imageUrl;
  final bool isPlaylist;
  final bool isRequest;
  final bool isParticipant;

  const MusicListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.imageUrl,
    this.isPlaylist = false,
    this.isRequest = false,
    this.isParticipant = false,
  });

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      leading: isParticipant
          ? ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      getRandomColor(),
                      Colors.black,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    title[0].toUpperCase(),
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF).withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                imageUrl!,
              ),
            ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Gotham',
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      subtitle: isParticipant
          ? null
          : Text(
              subtitle ?? '',
              style: const TextStyle(
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
      trailing: isRequest
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.check, color: Colors.green),
                  onPressed: () {},
                ),
              ],
            )
          : isParticipant
              ? null
              : InkWell(
                  onTap: () {},
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.more_vert,
                      color: Color(0xff737373),
                    ),
                  ),
                ),
    );
  }
}
