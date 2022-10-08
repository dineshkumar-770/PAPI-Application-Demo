import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_understanding/Model/data_model.dart';
import 'package:riverpod_understanding/constants/constants.dart';

class GetApiData {
  Future<PornData> getData(String link) async {
    Uri url = Uri.parse(link);
    var response = await http.get(url, headers: {
      'X-RapidAPI-Key': 'e7eff69b2amsh2e26d250794a32dp1a580djsnf7ebf55b9071',
      'X-RapidAPI-Host': 'papi-pornstarsapi.p.rapidapi.com'
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var finalData = PornData.fromJson(data);
      return finalData;
    } else {
      throw (response.statusCode);
    }
  }
}

final apiProvider = FutureProvider.autoDispose<PornData>((ref) async {
  return await GetApiData().getData(mainUrl);
});
