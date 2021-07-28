import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'XRP',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const API_KEY = 'D1913B2E-2CAA-4ABE-A7EF-FFA9419F630E';
const SUB_API_KEY = '46CD5D12-5D7F-4750-A344-D49AEDA9A2A5';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    //BTC:123,LTC:123과 같은형태로 저장해줄것
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$API_KEY';
      http.Response response = await http.get(Uri.parse(requestURL));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        double price = body['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);//소수점기준 양수 -> 소숫점아래까지 진행, 반올림한후에 String화함.
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
