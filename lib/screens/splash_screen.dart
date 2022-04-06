import 'dart:io';
import 'data.dart';
import 'package:flutter/material.dart';
import 'landing_page.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  List<SliderModel> mySLides = new List<SliderModel>.empty(growable: true);
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xff4CA7F8) : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         const Color(0xffee0000),
      //         const Color(0xffeeee00)
      //       ],
      //       // colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)]
      //     )
      // ),

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile(
                logo: mySLides[1].getlogo(),
                imagePath: mySLides[0].getImageAssetPath(),
                desc: mySLides[0].getdesc(),
              ),
              SlideTile(
                logo: mySLides[1].getlogo(),
                imagePath: mySLides[1].getImageAssetPath(),
                desc: mySLides[1].getdesc(),
              ),
              SlideTile(
                logo: mySLides[1].getlogo(),
                imagePath: mySLides[2].getImageAssetPath(),
                desc: mySLides[2].getdesc(),
              )
            ],
          ),
        ),

        bottomSheet: slideIndex != 2 ? Container(
          margin: EdgeInsets.symmetric(vertical: 16),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  LandingPage()),);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "SKIP",
                  style: TextStyle(color: Color(0xff4CA7F8), fontWeight: FontWeight.w600),
                ),
              ),

              Container(
                child: Row(
                  children: [
                    for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                  ],),
              ),
              FlatButton(
                onPressed: (){
                  print("this is slideIndex: $slideIndex");
                  controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Color(0xff4CA7F8), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ): InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>  LandingPage()),);
          },
          child: Container(
            height: Platform.isIOS ? 70 : 60,
            color: Color(0xff4CA7F8),
            alignment: Alignment.center,
            child: Text(
              "GET STARTED NOW",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),

        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, desc, logo;

  SlideTile({ this.imagePath,  this.desc,  this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Image.asset(
            logo,
            height: 50,
            width: MediaQuery.of(context).size.width,
          ),

          SizedBox(
            height: 40,
          ),

          Image.asset(imagePath),

          SizedBox(
            height: 40,
          ),


          Text(desc, textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14))

        ],
      ),
    );
  }
}

