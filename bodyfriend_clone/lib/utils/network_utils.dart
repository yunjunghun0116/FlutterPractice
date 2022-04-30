import 'package:get/get.dart';

class NetworkUtils extends GetConnect {
  Future<void> getBanner() async {
    Response data = await get(
      'https://dapi.kakao.com/v3/search/book?target=title',
      headers: {
        'Authorization': 'KakaoAK a33bed6fb12716b0522c1a1685377dfa',
      },
      query: {'query': '미움받을 용기'},
      contentType: 'application/json',
    );
  }
}
