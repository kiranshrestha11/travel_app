import 'package:flutter/material.dart';
import 'package:travel_app/constants/app_text.dart';
import 'package:travel_app/constants/constants.dart';
import 'package:travel_app/views/nav_pages/main_page.dart';
import 'package:travel_app/views/nav_pages/search_page.dart';
import 'package:travel_app/widgets/responsive_btn.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List _pages = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/" + _pages[index]),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeText(text: "Trips"),
                        MediumText(
                          text: "Mountain",
                          size: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: MediumText(
                            align: TextAlign.left,
                            text:
                                "A mountain is an elevated portion of the Earth's crust, generally with steep sides & exposed bedrock.",
                            color: Constants.textColor2,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: (() => Navigator.of(context)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()),
                                  (route) => false)),
                          child: ResponsiveBtn(
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                    Column(children: [
                      ...List.generate(
                        3,
                        (indexDots) => Container(
                          margin: EdgeInsets.only(bottom: 3),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? Constants.mainColor
                                  : Constants.mainColor.withOpacity(0.3)),
                        ),
                      )
                    ])
                  ],
                ),
              ),
            );
          }),
    );
  }
}
