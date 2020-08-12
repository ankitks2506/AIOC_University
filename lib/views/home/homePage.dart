import 'package:firebase_auth/firebase_auth.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:university/agora/src/pages/index.dart';
import 'package:university/main.dart';
//import 'package:university/ui-components/cart/cartPage.dart';
//import 'package:university/ui-components/certifications/certificationPage.dart';
//import 'package:university/ui-components/profilePage/profile.dart';
//import 'package:university/views/myCoursesPage/myCoursesPage.dart';
//import 'package:university/views/notificationsPage/notificationsPage.dart';
//import 'package:university/views/refer&Earn/referAndEarn.dart';

import 'mainHomePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int bottomNavIndex = 0;
  bool isLoading = false;

  List<Widget> pages = [MainHomePage(),];

  FirebaseUser user;
  onLoadActivity()async{
    setState(() {
      isLoading = true;
    });
    user = await FirebaseAuth.instance.currentUser();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    onLoadActivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(

      drawer: Drawer(

        child: ListView(
          children: <Widget>[
//            UserAccountsDrawerHeader(
//              decoration: BoxDecoration(
//                color: Colors.black
//              ),
//              currentAccountPicture: user.photoUrl == null ? Image.asset("./assets/images/mainLogo.png") : CircleAvatar(
//                backgroundImage: NetworkImage(user.photoUrl),
//              ),
//              accountName: user.displayName == null ? Text("User", style: TextStyle(
//                fontFamily: "Nunito Sans Bold",
//                fontSize: 18.0
//              ),) : Text(user.displayName, style: TextStyle(
//                fontFamily: "Nunito Sans Bold",
//                fontSize: 18.0
//              ),),
//              accountEmail: Text(user.email, style: TextStyle(
//                fontFamily: "Nunito Sans Bold"
//              ),),
//            ),
            // ListTile(
            //   leading: Icon(Icons.work),
            //   title: Text("Placements", style: TextStyle(
            //     fontFamily: "Nunito Sans Bold"
            //   ),),
            //   trailing: Icon(Icons.chevron_right),
            // ),
//            ListTile(
//              onTap: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
//              },
//              leading: Icon(Icons.shopping_cart),
//              title: Text("Cart", style: TextStyle(
//                  fontFamily: "Nunito Sans Bold"
//              ),),
//              trailing: Icon(Icons.chevron_right),
//            ),

//            ListTile(
//              onTap: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>CertificationPage()));
//              },
//              leading: Icon(Icons.book),
//              title: Text("Certificates", style: TextStyle(
//                  fontFamily: "Nunito Sans Bold"
//              ),),
//              trailing: Icon(Icons.chevron_right),
//            ),
//            ListTile(
//              onTap: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReferAndEarn()));
//              },
//              leading: Icon(Icons.monetization_on),
//              title: Text("Refer and earn", style: TextStyle(
//                  fontFamily: "Nunito Sans Bold"
//              ),),
//              trailing: Icon(Icons.chevron_right),
//            ),
//            ListTile(
//              onTap: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
//              },
//              leading: Icon(Icons.person),
//              title: Text("Profile", style: TextStyle(
//                  fontFamily: "Nunito Sans Bold"
//              ),),
//              trailing: Icon(Icons.chevron_right),
//            ),
            ListTile(
              onTap: ()async{
                final Email email = Email(
                    subject: "Support - AIOC Live Classes App!",

                    body: "Please Tell us the issue! and also Please share a screen shot and necessary information regarding the issue!",
                    recipients: ["aiocdeveloper@gmail.com"],
                    bcc: ["device@allinonecyberteam.com"],
                    isHTML: false
                );
                await FlutterEmailSender.send(email);
              },
              leading: Icon(Icons.help),
              title: Text("Support/Help", style: TextStyle(
                  fontFamily: "Nunito Sans Bold"
              ),),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: (){

              },
              leading: Icon(Icons.library_books),
              title: Text("Terms & Conditons", style: TextStyle(
                  fontFamily: "Nunito Sans Bold"
              ),),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text("Privacy Policy", style: TextStyle(
                  fontFamily: "Nunito Sans Bold"
              ),),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>SplashScreen()), (Route<dynamic> route) => false);
              },
              leading: Icon(Icons.check),
              title: Text("Log out", style: TextStyle(
                  fontFamily: "Nunito Sans Bold"
              ),),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("AIOC", style: TextStyle(
            fontFamily: "Nunito Sans Extra Bold",
            color: Colors.white
        ),),
        actions: <Widget>[
          // IconButton(
          //   onPressed: (){

          //   },
          //   icon: Icon(Icons.search),
          // ),
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>IndexPage()));
            },
            icon: Icon(Icons.search),
          ),
//          IconButton(
//            onPressed: (){
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
//            },
//            icon: Icon(Icons.shopping_cart),
//          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: bottomNavIndex,
        onTap: (int i){
          setState(() {
            bottomNavIndex = i;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text("Home", style: TextStyle(
                  fontFamily: "Nunito Sans Bold",
                  color: Colors.white
              ),),
              icon: Icon(Icons.home, color: Colors.white,)
          ),
          BottomNavigationBarItem(
              title: Text("My Courses", style: TextStyle(
                  fontFamily: "Nunito Sans Bold",color: Colors.white
              ),),
              icon: Icon(Icons.book, color: Colors.white,)
          ),
          // BottomNavigationBarItem(
          //   title: Text("Notifications", style: TextStyle(
          //     fontFamily: "Nunito Sans Bold"
          //   ),),
          //   icon: Icon(Icons.notifications)
          // ),
        ],
      ),
      body: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('./assets/images/blurLogo.png'),
                fit: BoxFit.cover,
              ),
              color: Colors.black87,
            ),

            child: pages[bottomNavIndex],
          ),
        ),
      ),

    );
  }
}