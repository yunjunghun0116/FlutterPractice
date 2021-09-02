import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytube/src/models/youtube_video_result.dart';
import 'package:mytube/src/repository/youtube_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoutubeSearchController extends GetxController {
  //로컬스토리지를 통한 접근
  SharedPreferences? props;
  String _searchKey = 'SearchKey';
  String _currentSearchWord = '';
  //리스트를 초기화해주는 과정
  // = [''].obs와 같은과정
  //하지만 빈 데이터가 보여질수 있기때문에 아예 비워주는 과정을 거친다
  RxList<String> _history = RxList<String>.empty(growable: true);
  Rx<YoutubeVideoResult> youtubeSearchResult = YoutubeVideoResult().obs;

  ScrollController scrollController = ScrollController();

  RxList<String> get history => _history;

  @override
  void onInit() async {
    // TODO: implement onInit
    // 이전 검색기록 가져오는과정
    props = await SharedPreferences.getInstance();
    List<String>? initData = props!.getStringList(_searchKey);
    _history(initData);
    _scrollControllerEvent();
    super.onInit();
  }

  void _scrollControllerEvent() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent &&
            youtubeSearchResult.value.nextPageToken != '') {
          search(_currentSearchWord);
        }
      },
    );
  }

  void search(String searchWord) {
    _history.addIf(!_history.contains(searchWord), searchWord);
    props!.setStringList(_searchKey, _history);
    _searchInYoutube(searchWord);
    _currentSearchWord = searchWord;
  }

  void _searchInYoutube(String searchWord) async {
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .search(searchWord, youtubeSearchResult.value.nextPageToken ?? '');
    print(youtubeVideoResult.toString());
    if (youtubeSearchResult.value.items != null) {
      youtubeSearchResult.update((prevSearchResult) {
        prevSearchResult!.nextPageToken = youtubeVideoResult!.nextPageToken;
        prevSearchResult.items!.addAll(youtubeVideoResult.items!);
      });
    } else {
      youtubeSearchResult(youtubeVideoResult);
    }
  }
}
