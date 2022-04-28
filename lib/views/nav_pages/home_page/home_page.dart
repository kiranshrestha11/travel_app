import 'package:flutter/material.dart';
import 'package:travel_app/constants/app_text.dart';
import 'package:travel_app/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var images = {
      "Balloning": "balloning.png",
      "Hiking": "hiking.png",
      "Kayaking": "kayaking.png",
      "Snorkling": "snorkling.png"
    };

    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),

          //discover text
          Container(
            margin: EdgeInsets.only(left: 20),
            child: LargeText(text: "Discover"),
          ),
          SizedBox(height: 15),

          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                isScrollable: true,
                indicator:
                    CircleTabIndicator(color: Constants.mainColor, radius: 4),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Insipiration"),
                  Tab(text: "Emotions")
                ],
              ),
            ),
          ),

          //tabBarView
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15.0, top: 10),
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/images/mountain.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  );
                },
              ),
              Text(""),
              Text(""),
            ]),
          ),

          SizedBox(height: 20),

          //Explore text
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LargeText(text: "Explore More", size: 22),
                MediumText(
                  text: "See All",
                  color: Constants.textColor1,
                )
              ],
            ),
          ),

          SizedBox(height: 10),

          //ListView.builder
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          height: 76,
                          width: 76,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/images/" +
                                    images.values.elementAt(index)),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: MediumText(
                            text: images.keys.elementAt(index),
                            color: Constants.textColor2,
                            size: 13,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

//in tabBar indicator takes decoration that needs to be extended
class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

//Decoration requires BoxPainter
class CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
