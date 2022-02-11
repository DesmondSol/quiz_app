import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/Authentication/sign_up_page.dart';
import 'package:quiz_app/screens/Authentication/sign_in_page.dart';
import 'package:quiz_app/screens/Explore/explore.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Page title'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.black45,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
                                  onTap: () => Get.to(QuizScreen()),
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
    );
  }
}
