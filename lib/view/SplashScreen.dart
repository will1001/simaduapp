import 'package:flutter/material.dart';
import 'LandingPage.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),
    (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (c) => LandingPage(title:widget.title,selectedIndex: 0,)));
    },
    
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Opacity(opacity: 0.0, child: Icon(Icons.home)),
      //   centerTitle: true,
      //       title: Text(widget.title,style: TextStyle(fontSize: 16.0),),
      // ),
      body: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
        MaterialPageRoute(builder: (c) => LandingPage(title:widget.title)));
        },
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  height: 150,
                  child: FadeInImage(
                      fadeInDuration: const Duration(seconds: 1),
                      placeholder: AssetImage('assets/images/logo.jpg'),
                      image: AssetImage('assets/images/logo.jpg'),
                    ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}