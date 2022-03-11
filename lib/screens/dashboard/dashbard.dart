import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

class Explore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExploreState();
}

class ExploreState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black54,
                  elevation: 0,
                  bottom: TabBar(
                      unselectedLabelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.black26]),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("programming"),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("culture"),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("science"),
                          ),
                        ),
                      ]),
                ),
                body: TabBarView(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        onTap: () => Get.to(QuizScreen()),
                        leading: Icon(Icons.album),
                        title: Text('Question 1'),
                        subtitle: Text('a question on computers by solomon T'),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextButton(
                              child: Text('programming'), //tags
                              onPressed: () => Get.to(QuizScreen()),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: Text('flutter'), //tags
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                            Spacer(
                              flex: 2,
                            ),
                            TextButton(
                              child: Icon(Icons.star), //star icon
                              onPressed: () => Get.to(QuizScreen()),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: Icon(
                                  Icons.arrow_circle_up_outlined), //upvote icon
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                          ]),
                    ],
                  ),
                  Icon(Icons.movie),
                  Icon(Icons.games),
                ]),
              )),
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        ],
      ),
    );
  }
}
