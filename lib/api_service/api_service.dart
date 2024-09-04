import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_route/api_service/api_const.dart';
import 'package:news_app_route/api_service/news_response_model.dart';
import 'package:news_app_route/api_service/sourceResponse_model.dart';

class APIService {
  static Future<SourceResponse> getSources(String categoryId) async {
    final uri = Uri.https(ApiConst.baseUrl, ApiConst.sourcesEndPoint, {
      'apiKey': ApiConst.apiKey,
      'category': categoryId,
    });

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }

  static Future <NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(ApiConst.baseUrl, ApiConst.newsEndPoint, {
      'apiKey': ApiConst.apiKey,
      'sources': sourceId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return  NewsResponse.fromJson(json);


  }
}
