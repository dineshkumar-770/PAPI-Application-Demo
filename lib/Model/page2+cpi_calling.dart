import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_understanding/Model/data_model.dart';

class NextPageClass {
  Future<PornData> nextPagedata(String pagenumber) async {
    Uri url = Uri.parse(
        'https://papi-pornstarsapi.p.rapidapi.com/pornstars/?max_rank=200&min_rank=151&page=$pagenumber');
    var response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': 'e7eff69b2amsh2e26d250794a32dp1a580djsnf7ebf55b9071',
        'X-RapidAPI-Host': 'papi-pornstarsapi.p.rapidapi.com'
      },
    );
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      var porndata = PornData.fromJson(decodeData);
      return porndata;
    } else {
      throw ('Fuck you!');
    }
  }
}

final nextPageProvider = FutureProvider.autoDispose((ref) async {
  return NextPageClass().nextPagedata('2');
});

final lastPageProvider = FutureProvider.autoDispose((ref) {
  return NextPageClass().nextPagedata('3');
});
