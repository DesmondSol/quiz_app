import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/Authentication/sign_up_page.dart';
import 'package:quiz_app/screens/Authentication/sign_in_page.dart';

class Selector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
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
                    style: Theme.of(context).textTheme.headline4.copyWith(
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
                                  onTap: () => Get.to(QuizScreen()),
                                  //  leading: Icon(Icons.album),
                                  title: Text('Explore Questions'),
                                  //   subtitle: Text('Music by Julie Gable.'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                child: ListTile(
                                  onTap: () => Get.to(QuizScreen()),
                                  //  leading: Icon(Icons.album),
                                  title: Text('Create Questions'),
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
                                  title: Text('Explore Questions'),
                                  //   subtitle: Text('Music by Julie Gable.'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                child: ListTile(
                                  onTap: () => Get.to(QuizScreen()),
                                  //  leading: Icon(Icons.album),
                                  title: Text('Create Questions'),
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
