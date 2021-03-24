import 'dart:convert';
import 'package:flutter_news_app/model/article_model.dart';
import 'package:http/http.dart';

// Now let's make the HTTP request services
// this class will allow us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  // Let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  // for this example I'm going to use a single endpoint

  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8fdcd1391f4646f68db241a5613a60e0";

  //Now let's create the http request function

  Future<List<ArticleModel>> getArticle() async {
    Response res = await get(endPointUrl);
    //1st check that we got a 200 status code: this mean that the request was a success
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      // this line will allow us to get the different articles from the json file & putting them into the list
      List<ArticleModel> articles =
          //body?.map((dynamic item) => Article.fromJson(item))?.toList() ?? [];
           body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
      //print(articles);
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
