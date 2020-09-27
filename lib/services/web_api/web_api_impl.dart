import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moolax/business_logic/models/rate.dart';
import 'package:moolax/services/api_url.dart';
import 'package:moolax/services/web_api/web_api.dart';

class WebApiImpl implements WebApi {
  List<Rate> _rateCache;
  var header = {'Accept': 'application/json'};
  
  @override
  Future<List<Rate>> fetchExchangeRates() async {
    if(_rateCache == null) {
      final uri = Uri.https(kBaseUrl, kLatestPath);
      final result = await http.get(uri,headers: header);
      _rateCache = _createRateListFromRawMap(jsonDecode(result.body));
    } else {
      print('getting rates from cache');
    }
    return _rateCache;
  }

  List<Rate> _createRateListFromRawMap(Map jsonObject) {
    final Map rates = jsonObject['rates'];
    final String base = jsonObject['base'];
    List<Rate> list = [];
    list.add(Rate(baseCurrency: base, quoteCurrency: base, exchangeRate: 1.0));
    for (var rate in rates.entries) {
      list.add(Rate(baseCurrency: base,
          quoteCurrency: rate.key,
          exchangeRate: rate.value as double));
    }
    return list;
  }

}