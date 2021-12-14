import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/helper/alerts.dart';
import 'package:muslim_app/model/news_model.dart';
import 'package:muslim_app/services/non_auth_apis/news_api_actions/get_news_actions.dart';
import 'package:muslim_app/src/base_provider.dart';

class GetNewsProvider extends BaseProvider {
  List<NewsModel> newsLists = [];
  void getAllNews() async {
    try {
      // Alerts.loadingAlert(context, "Loading all news");
      BotToast.showLoading();
      var getNewsResponse = await NewsAPIS.getNews();
      print(getNewsResponse.runtimeType);
      List gottenNews = List.from(getNewsResponse['data']);
      newsLists = gottenNews.map((json) => NewsModel.fromJson(json)).toList();
      Alerts.closeLoadingAlert();
      notifyListeners();
    } catch (e) {
      print("NEWS GETING ERROR....$e");
      Alerts.closeLoadingAlert();
      // Alerts.errorAlert(
      //     context, "Failed to load news because ERROE $e OCCURED");
      rethrow;
    }
  }

  GetNewsProvider() {
    getAllNews();
  }
}
