import 'package:moolax/business_logic/models/rate.dart';
import 'package:moolax/services/web_api/web_api.dart';

class FakeWebApi implements WebApi {
  @override
  Future<List<Rate>> fetchExchangeRates() async {
    return List<Rate>()
        ..add(Rate(baseCurrency: 'USD',quoteCurrency: 'EUR',exchangeRate: 0.9))
        ..add(Rate(baseCurrency: 'USD',quoteCurrency: 'CNY',exchangeRate: 7.05))
        ..add(Rate(baseCurrency: 'USD',quoteCurrency: 'MNT',exchangeRate: 2668.37));
  }

}