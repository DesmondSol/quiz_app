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
                  //   Text("Enter your informations below"),
                  // Spacer(), // 1/6
                  // TextField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Color(0xFF1C2341),
                  //     hintText: "Full Name",
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //   ),
                  // ),
                  Spacer(), // 1/6
                  Row(
                    children: <Widget>[
                      // Expanded(
                      //   child: Text('Deliver features faster',
                      //       textAlign: TextAlign.center),
                      // ),
                      // Expanded(
                      //   child: Text('Craft beautiful UIs',
                      //       textAlign: TextAlign.center),
                      // ),
                      Expanded(
                        // child: FittedBox(
                        //   fit: BoxFit.contain,
                          child: InkWell(
                            onTap: () => Get.to(SignIn()),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.all(kDefaultPadding * 0.75), // 15
                              decoration: BoxDecoration(
                                gradient: kPrimaryGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Text(
                                "Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                        
                      ),

                      Expanded(
                        // child: FittedBox(
                        //   fit: BoxFit.contain,
                          child: InkWell(
                            onTap: () => Get.to(SignUp()),
                            child: Container(
                              width: double.infinity,
                              height:110,
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.all(kDefaultPadding * 0.75), // 15
                              decoration: BoxDecoration(
                                gradient: kPrimaryGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Text(
                                "continue",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                        
                      ),
                      // Expanded(
                      //   child: FittedBox(
                      //     fit:
                      //         BoxFit.contain, // otherwise the logo will be tiny
                      //     child: FlutterLogo(),
                      //   ),
                      // ),
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
