import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/Explore/explore.dart';
import 'package:quiz_app/screens/add_questions/add_questions.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'side_menu.dart';
import 'swipe_animation.dart';

import 'package:quiz_app/models/sidebar_model.dart';

void main() {
  runApp(Selector());
}

class Selector extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF46A0AE, color),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  Animation<double> animation;
  AnimationController controller;
  bool isNavigationDrawerOpened = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<SwipeAnimationState> swipeAnimationKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF101010),
        body: Stack(
          children: <Widget>[
            SideMenu(
              onMenuItemSelection: (pageIndex) {
                swipeAnimationKey.currentState.hideNavigationDrawer();
                setState(() {
                  currentPage = pageIndex;
                });
              },
            ),
            SwipeAnimation(
              key: swipeAnimationKey,
              navigationDrawerOpened: (isOpened) {
                isNavigationDrawerOpened = isOpened;
                if (isNavigationDrawerOpened) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
              child: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  backgroundColor: Colors.black45,
                  leading: IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.arrow_menu,
                      progress: animation,
                    ),
                    onPressed: () {
                      if (isNavigationDrawerOpened) {
                        controller.reverse();
                        swipeAnimationKey.currentState.hideNavigationDrawer();
                      } else {
                        controller.forward();
                        swipeAnimationKey.currentState.showNavigationDrawer();
                      }
                    },
                  ),
                  title: Text(menuItems[currentPage].menuName),
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                ),
                backgroundColor: Color(0xFF101010),
                body: Stack(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(flex: 2), //2/6
                            Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.white,
                              size: 80.0,
                            ),
                            Text(
                              "Let's Play Quiz,",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),

                            Spacer(), // 1/6
                            Column(
                              children: [
                                Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Card(
                                          child: ListTile(
                                            onTap: () => Get.to(Explore()),
                                            //  leading: Icon(Icons.album),
                                            title: Text('Explore Questions'),
                                            subtitle: Text('1000'),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Card(
                                          child: ListTile(
                                            onTap: () => Get.to(addQuestions()),
                                            //  leading: Icon(Icons.album),
                                            title: Text('Create Questions'),
                                            subtitle: Text('New'),
                                          ),
                                        ),
                                      ),
                                    ]),
                                Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Card(
                                          child: ListTile(
                                            onTap: () => Get.to(QuizScreen()),
                                            //  leading: Icon(Icons.album),
                                            title: Text('dashbord'),
                                            //   subtitle: Text('Music by Julie Gable.'),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Card(
                                          child: ListTile(
                                            onTap: () => Get.to(QuizScreen()),
                                            //  leading: Icon(Icons.album),
                                            title: Text('search'),
                                            //   subtitle: Text('Music by Julie Gable.'),
                                          ),
                                        ),
                                      ),
                                    ]),
                                Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Card(
                                          child: ListTile(
                                            onTap: () => Get.to(QuizScreen()),
                                            //  leading: Icon(Icons.album),
                                            title: Text('trending'),
                                            //   subtitle: Text('Music by Julie Gable.'),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Card(
                                          child: ListTile(
                                            onTap: () => Get.to(QuizScreen()),
                                            //  leading: Icon(Icons.album),
                                            title: Text('favorite'),
                                            //   subtitle: Text('Music by Julie Gable.'),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            ),

                            Spacer(flex: 2), // it will take 2/6 spaces
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
