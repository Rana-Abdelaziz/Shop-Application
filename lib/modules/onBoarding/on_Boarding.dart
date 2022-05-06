import 'package:flutter/material.dart';
import 'package:shop_app/models/onBoardingModel/on_Boarding_Model.dart';
import 'package:shop_app/modules/logIn/login.dart';
import 'package:shop_app/shared/network/shared_prefernce.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;
  List<OnBoardingModel> pages = [
    OnBoardingModel(
        imgUrl: 'assets/images/onboardingimage.png',
        screenBody: 'ScreenBody One',
        screenTitle: 'ScreenTitle One'),
    OnBoardingModel(
        imgUrl: 'assets/images/onboardingimage.png',
        screenBody: 'ScreenBody Two',
        screenTitle: 'ScreenTitle Two'),
    OnBoardingModel(
        imgUrl: 'assets/images/onboardingimage.png',
        screenBody: 'ScreenBody Three',
        screenTitle: 'ScreenTitle Three'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            TextButton(
                onPressed: () {
                  //SharedPreference.putData('token', '');
                  SharedPreference.putData('onBoarding', false).then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  });
                },
                child: Text(
                  'SKIP',
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => onBoardingItem(pages[index]),
                  itemCount: pages.length,
                  controller: boardController,
                  onPageChanged: (index) {
                    if (index == pages.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      isLast = false;
                    }
                  },
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                        expansionFactor: 4.0,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.lightBlue),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        // SharedPreference.putData('token', '');
                        SharedPreference.putData('onBoarding', false)
                            .then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        });
                      } else {
                        boardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

Widget onBoardingItem(OnBoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.imgUrl}'),
          ),
        ),
        Text('${model.screenTitle}', style: TextStyle(fontSize: 24.0)),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '${model.screenBody}',
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
