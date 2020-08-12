import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/views/home/homePage.dart';
import 'package:university/views/home/mainHomePage.dart';


//String razorPayApi = "rzp_live_Omt3L65NUaiYGk";
String razorPayApi = "rzp_test_vMoN7yestyPGqX";

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito Sans Regular"
      ),
      home: SplashScreen(),
    )
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  onLoadActivity()async{
    await Future.delayed(Duration(seconds: 1), ()async{
      FirebaseUser user = await FirebaseAuth.instance.currentUser();

      if(user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
//      }else{
//        await AuthLogic().userActivityInFirestore(context, user, user.displayName, null, null);
//      }
    });
  }
  
  @override
  void initState() {
    onLoadActivity();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("./assets/images/mainLogo.png", height: 150.0,),
      )
    );
  }
}