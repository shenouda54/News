import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/SourceResponse.dart';
import 'package:news/moddels/NewsData.dart';

class ApiManager {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=03bc47f61df040e78f489085aa8664cf
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "03bc47f61df040e78f489085aa8664cf"});
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(jsonFormat);
    return sourceResponse;
  }

 static Future<NewsDataResponse> getNewsData(String sourceId) async {
//https://newsapi.org/v2/everything?q=bitcoin&apiKey
// =03bc47f61df040e78f489085aa8664cf
    Uri url = Uri.https("newsapi.org", "/v2/everything",
        {"apiKey": "03bc47f61df040e78f489085aa8664cf",
        "sources":sourceId,
        });
    http.Response response = await http.get(url);

    var jsonFormat = jsonDecode(response.body);

    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);
    return newsDataResponse;
  }
}
