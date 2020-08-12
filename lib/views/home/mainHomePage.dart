import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university/ui-components/subHead.dart';
import 'package:university/models/popularData.dart';
 
class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

  List<String> categories = ["Web Development", "Mobile Development", "Security", "Coding", "Artifical Intelligence", "Cloud Computing", "Machine Learning"];
  List<String> cateImgLinks = ["./assets/images/web-development.jpg", "./assets/images/app-development.jpg", "./assets/images/security.jpg", "./assets/images/programming.jpg", "./assets/images/ai.jpg", "./assets/images/cloud.jpg", "./assets/images/ml.jpg"];
  bool isLoading = false;
  List<Data> popularData = List<Data>();
  List<DocumentSnapshot> newReleases = [];

  onLoadActivity()async{
    setState(() {
      isLoading = true;
    });
    await Firestore.instance.collection("courses").orderBy("views", descending: true).limit(5).getDocuments().then((QuerySnapshot querySnapshot){

    });
    await Firestore.instance.collection("courses").orderBy("courseCreatedOn", descending: true).limit(5).getDocuments().then((QuerySnapshot querySnapshot){
      setState(() {
        newReleases = querySnapshot.documents;
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    onLoadActivity();
//    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Courses", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w800),),
                      Icon(Icons.score , color: Colors.white,)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text("Categories", style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Nunito Sans Bold",
                      fontSize: 17.0
                  ),),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 130.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, i){
                      return Container(
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.only(left: 20.0),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(cateImgLinks[i])
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0,
                                    )
                                  ]
                              ),
                              width: 100.0,
                              height: 100.0,
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Text(categories[i], textAlign: TextAlign.center, style: TextStyle(
                                  fontFamily: "Nunito Sans Bold",
                                  color: Colors.white
                              ),),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SubHeading(text: "Popular Courses",),
                      IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.arrow_forward, size: 20.0, color: Colors.white,),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
