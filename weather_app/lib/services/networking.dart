import 'package:http/http.dart' as http;
import 'dart:convert';

//api 주소를 가져오게되면 그 api주소를 어떻게 처리할것인지 -> 제대로 api로 요청을 보냈을떄
//body를 받게되면 그것을 json으로 디코딩해서 넘겨준다
class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
