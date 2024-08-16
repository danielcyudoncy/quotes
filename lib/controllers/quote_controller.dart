import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:quotes/models/quote_model.dart';


class QuotesController extends GetxController {
  var quotes = <Quote>[].obs;
  final Dio _dio = Dio();
  var page = 1;
  final int limit = 10;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    if (isLoading.value) return; 
    isLoading.value = true;
    try {
      var response = await _dio.get('https://dummyjson.com/quotes', queryParameters: {
        'page': page,
        'limit': limit,
      });
      var fetchedQuotes = (response.data['quotes'] as List).map((q) => Quote.fromJson(q)).toList();
      quotes.addAll(fetchedQuotes);
      page++;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void searchQuotes(String query) {
    var filteredQuotes = quotes.where((quote) => quote.quote.toLowerCase().contains(query.toLowerCase())).toList();
    quotes.value = filteredQuotes;
  }
}
