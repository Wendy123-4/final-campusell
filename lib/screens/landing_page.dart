import 'package:flutter/material.dart';
import 'package:flutter_appme/shared/constants.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfffededed),
      body: Center(

        child: Container(
          margin: EdgeInsets.only(left: 40.0, right: 40.0),
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 120)),
              const Center(
                  child:  Image(image: AssetImage("images/logo3.png"))),
              Padding(padding: const EdgeInsets.all(10)),
              const SizedBox(height: 120,),
              Container(
                height: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.resolveWith<double>(
                        // As you said you don't need elevation. I'm returning 0 in both case
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return 0;
                          }
                          return 0; // Defer to the widget's default.
                        },
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/shopperLanding");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.all(10)),
                      Expanded(
                          child:
                              Image.asset('images/sell.png')),
                      Expanded(
                          child: Text("Browse Products (Buyer)",
                              style: TextStyle(fontSize: 14, color: fontType)))
                    ],
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(15)),
              Container(
                height: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.resolveWith<double>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return 0;
                          }
                          return 0; // Defer to the widget's default.
                        },
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/authenticationPage");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.all(10)),
                      Expanded(
                          child:
                              Image.asset('images/buy.png')),
                      Expanded(
                          child: Text("List Products (Seller)",
                              style: TextStyle(fontSize: 14, color: fontType)))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
