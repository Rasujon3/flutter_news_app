import 'package:flutter/material.dart';
import 'package:flutter_news_app/components/custom_listTile.dart';
import 'package:flutter_news_app/components/custom_listTile.dart';
import 'package:flutter_news_app/model/article_model.dart';
import 'package:flutter_news_app/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   client.getArticle();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      // now let's call the API services with futureBuilder widget
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (context, snapshot) {
          // let's check if we got a response or not

          if (snapshot.hasData) {
            // Now let's make a list of articles
            //print("snapshot");
            List<Articles> articles = snapshot.data;
            return ListView.builder(
              // now let's crete our custom List of Articles
              itemCount: articles.length,
              itemBuilder: (context, index) => customListTile(articles[index],context),
            );
            return Center(
              child: Text("Success !"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
