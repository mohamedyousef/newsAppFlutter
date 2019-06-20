import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<int> colors = [0xFFBfff, 0xFFB0f0f0f, 0xFFBCCC];
  List<IconData> icons = [
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.data_usage,
    Icons.dashboard
  ];
  List<String> titles = [
    'Wellcome',
    'Dear Users',
    'UniyApps',
    'Is First Flutter '
  ];

  List<String> subtitles = [
    'Flutter is first uniyapps application is ai startup',
    ' Cool Fancy Text Generator is a copy and paste font generator and font changer that creates cool fonts. It converts a normal text to different free cool fonts styles, such as tattoo fonts, calligraphy fonts, web script fonts, cursive fonts, handwriting fonts, old English fonts, word fonts, pretty fonts, font art... Fonts for Facebook, Twitter, Instagram - If those are what you want then this tool is a perfect place to go because it provides more than that! ',
    'Basically, Cool Text Generator a cute copy and paste font generator online, font maker, font creator, font changer, special text maker, stylish text generator, weird text generator',
    'generator, webfont generator, signature maker, signature creator, free text symbols generator, logo animation maker, font manager... This tool helps generate text symbols, cool Unicode fancy letters, fancy writing',
    ' Fancy Text Generator is fun and handy, just copy these stylish beautiful design text and paste them anywhere such as in Facebook, Twitter, Whatsapp, Snapchat, Instagram Bio... with fancy fonts and impress your friends.'
  ];

  ValueNotifier<int> notifier;
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    notifier = new ValueNotifier(0);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Color(0xFFB0f0f0f)),
                ),
                new Column(
                  children: <Widget>[
                    Transform.translate(
                        offset: Offset(0, -30),
                        child: Icon(
                          icons[index],
                          size: 100,
                          color: Colors.white,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          titles[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: Text(
                        subtitles[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ]);
            },
            itemCount: 4,
            onPageChanged: (index) {
              notifier.value = index;
              UpdateScene();
            },
          ),
          Transform.translate(
            offset: Offset(0, 155),
            child: Align(
              child: _displayPageIndicators(4),
              alignment: Alignment.center,
            ),
          ),
          Align(
            child: Padding(
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: new Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, letterSpacing: 1),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  },
                  color: Colors.red.shade800,
                ),
              ),
              padding: const EdgeInsets.only(bottom: 55, right: 20, left: 20),
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }

  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
        pageIndexNotifier: notifier,
        length: length,
        normalBuilder: (animation, index) =>
            Circle(color: Colors.grey, size: 12),
        highlightedBuilder: (animationcontroller, index) => ScaleTransition(
              scale: CurvedAnimation(
                  parent: animationcontroller, curve: Curves.ease),
              child: Circle(
                size: 12,
                color: Colors.red,
              ),
            ));
  }

  void UpdateScene() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("seen", true);
  }
}
