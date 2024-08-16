// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:quotes/models/quote_model.dart';


class HomeController extends GetxController {
  var quotes = <Quote>[].obs;
  var isLoading = true.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
  }

  void fetchQuotes() async {
    try {
      isLoading(true);
      var response = await Dio().get('https://dummyjson.com/quotes');
      if (response.statusCode == 200) {
        var quotesList = (response.data['quotes'] as List)
            .map((quote) => Quote.fromJson(quote))
            .toList();
        quotes.assignAll(quotesList);
      }
    } finally {
      isLoading(false);
    }
  }

  void searchQuotes(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      fetchQuotes();
    } else {
      var filteredQuotes = quotes.where((quote) {
        return quote.quote.toLowerCase().contains(query.toLowerCase()) ||
            quote.author.toLowerCase().contains(query.toLowerCase());
      }).toList();
      quotes.assignAll(filteredQuotes);
    }
  }
}
