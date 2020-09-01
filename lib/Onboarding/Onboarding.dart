import 'package:flutter/material.dart';
import 'SplashScreen1.dart';


class Onboarding extends StatefulWidget{
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController controller;

  void getChangedPageAndMoveBar(int page){
    currentPageValue = page;
    setState(() {});
  }

  int currentPageValue;

  final List<Widget> introWidgetsList = <Widget>[
    SplashScreen1()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: introWidgetsList.length,
                  onPageChanged: (int page) {
                    getChangedPageAndMoveBar(page);
                  },
                  controller: controller,
                  itemBuilder: (context, index) {
                    return introWidgetsList[index];
                  }),
              Visibility(visible: currentPageValue == introWidgetsList.length - 1 ? true : false,
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(26))),
                    child: Text('GET STARTED',style: TextStyle(color: Colors.white),),
                  ),
                ),)
            ],
          ),
        ),
      ),
    );
  }
}