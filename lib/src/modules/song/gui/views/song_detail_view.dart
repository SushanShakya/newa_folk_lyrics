import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/view_models/lyrics_view_model.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/views/fragments/lyrics_fragment.dart';

class SongDetailView extends StatelessWidget {
  const SongDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height / 2;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (c, b) {
            return [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: h,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          "https://media.fuzia.com/assets/uploads/images/co_brand_1/article/2016/Matina.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                              colors: [
                                Colors.transparent,
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rajamati Kumati',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        "Shrestha",
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      FontAwesomeIcons.youtube,
                                      size: 30,
                                      color: Color(0xffcd201f),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: BackButton(),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,
                title: TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: "English",
                    ),
                    Tab(
                      text: "Nepali",
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              LyricsFragment(
                lyrics: [
                  VerseViewModel(
                    title: "Intro",
                    lines: [
                      "Rajamati kumati jike wasa pirati\nhaya baba Rajamati cha",
                      "Rajamati kumati jike wasa pirati\nhaya baba Rajamati cha",
                    ],
                  ),
                ],
              ),
              LyricsFragment(
                lyrics: [
                  VerseViewModel(
                    title: "Intro",
                    lines: [
                      "Rajamati kumati jike wasa pirati\nhaya baba Rajamati cha",
                      "Rajamati kumati jike wasa pirati\nhaya baba Rajamati cha"
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
