import 'dart:convert';
import 'local_storage_repository.dart';
//firebase를 통해 로그인기능구현하면 그이후에 필요한 uid,username등은 flutter_secure_storage에만 저장시켜두면 편할듯.
//extends LocalStorageRepository를 통해서 ContentsRepository에서도
//로컬스토리지에 접근이 가능하다.
class ContentsRepository extends LocalStorageRepository {
  //key값이 있어야지만 나의 스토리지에 접근이가능함.
  //그렇기때문에 write/read기능을 이용하기위해서는 key가 필요하고 이 키를 하나로 지정해둠/ 여러개로지정도 가능.
  final String MY_FAVORITE_KEY = "MY_FAVORITE_KEY";
  Map<String, dynamic> data = {
    "ara": [
      {
        "cid": "1",
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
      },
    ],
    "ora": [
      {
        "cid": "11",
        "image": "assets/images/ora-1.jpg",
        "title": "LG 통돌이세탁기 15kg(내부)",
        "location": "제주 제주시 오라동",
        "price": "150000",
        "likes": "13"
      },
      {
        "cid": "12",
        "image": "assets/images/ora-2.jpg",
        "title": "3단책장 전면책장 가져가실분",
        "location": "제주 제주시 오라동",
        "price": "무료나눔",
        "likes": "6"
      },
      {
        "cid": "13",
        "image": "assets/images/ora-3.jpg",
        "title": "브리츠 컴퓨터용 스피커",
        "location": "제주 제주시 오라동",
        "price": "1000",
        "likes": "4"
      },
      {
        "cid": "14",
        "image": "assets/images/ora-4.jpg",
        "title": "안락 의자",
        "location": "제주 제주시 오라동",
        "price": "10000",
        "likes": "1"
      },
      {
        "cid": "15",
        "image": "assets/images/ora-5.jpg",
        "title": "어린이책 무료드림",
        "location": "제주 제주시 오라동",
        "price": "무료나눔",
        "likes": "1"
      },
      {
        "cid": "16",
        "image": "assets/images/ora-6.jpg",
        "title": "어린이책 무료드림",
        "location": "제주 제주시 오라동",
        "price": "무료나눔",
        "likes": "0"
      },
      {
        "cid": "17",
        "image": "assets/images/ora-7.jpg",
        "title": "칼세트 재제품 팝니다",
        "location": "제주 제주시 오라동",
        "price": "20000",
        "likes": "5"
      },
      {
        "cid": "18",
        "image": "assets/images/ora-8.jpg",
        "title": "아이팜장난감정리함팔아요",
        "location": "제주 제주시 오라동",
        "price": "30000",
        "likes": "29"
      },
      {
        "cid": "19",
        "image": "assets/images/ora-9.jpg",
        "title": "한색책상책장수납장세트 팝니다.",
        "location": "제주 제주시 오라동",
        "price": "1500000",
        "likes": "1"
      },
      {
        "cid": "20",
        "image": "assets/images/ora-10.jpg",
        "title": "순성 데일리 오가닉 카시트",
        "location": "제주 제주시 오라동",
        "price": "60000",
        "likes": "8"
      },
    ],
    'hansol': [],
  };

  //2초를 기다린후 data['ara/ora/hansol']을 가져온다.
  Future<List<Map<String, String>>> loadContentsFromLocation(
      String location) async {
    await Future.delayed(Duration(milliseconds: 2000));
    return data[location];
  }

  //json은 리스트의 형태로 가져왔고, 각 요소들은 하나의 doc형태로 되어있어서
  //그중 cid를 통해 이게 내 flutter_secure_storage에 존재하고있나를 확인한다.
  Future<bool> isMyFavoriteContents(String contentId) async {
    //default값은 false, for문에서 걸러지지않으면 false로,걸러지면 true를 리턴.
    bool isMyFavoriteContents = false;
    List? json = await loadFavoriteContents();
    print('json(loadFavoriteContents()) : $json');
    if (json == null || !(json is List)) {
      return false;
    } else {
      for (dynamic data in json) {
        if (data["cid"] == contentId) {
          isMyFavoriteContents = true;
          break;
        }
      }
    }
    return isMyFavoriteContents;
  }

  //key에 해당하는 스토리지의 밸류를 가져온다.
  Future<List?> loadFavoriteContents() async {
    //Encode된 String의 형식으로 자료를 가져옴
    String? jsonString = await this.getStoredValue(MY_FAVORITE_KEY);
    print('jsonString : $jsonString');
    if (jsonString != null) {
      Map<String, dynamic> json = jsonDecode(jsonString);
      //jsonString은 storage의 모든밸류값을 가져왔고,
      //return 값은 그중 key가 favorites인것들만 리턴해준다.
      return json["favorites"];
    } else {
      //자료가 없을땐 null을 보내주고 그러면 판단할때 null인지 판단해줘야함.
      return null;
    }
  }

  //저장을 해주는 기능을 한다.
  Future<void> addMyFavoriteContent(Map<String, String> content) async {
    List? loadLocalStorageDatas = await loadFavoriteContents();
    //is List는 가져온 데이터타입이 List의 형태인지를 판단하기위함.
    if (loadLocalStorageDatas == null || !(loadLocalStorageDatas is List)) {
      //배열을 하나 만들고, 그 배열안에 content하나만 들어가있는형태.
      loadLocalStorageDatas = [content];
    } else {
      //배열에 원소가 존재할경우 그 배열 마지막에 새로운content를 추가해줌.
      loadLocalStorageDatas.add(content);
    }
    //기존리스트에다가 새로운 콘텐츠를 추가한상태로
    //내 스토리지에 저장을 하는방식
    updateFavoriteContent(loadLocalStorageDatas);
  }

  void updateFavoriteContent(List loadLocalStorageDatas) async {
    Map<String, dynamic> myFavoriteDatas = {"favorites": loadLocalStorageDatas};
    //Encode의 기능은 json으로 저장하는것
    print('myFavoriteDatas : $myFavoriteDatas');
    await this.storeValue(MY_FAVORITE_KEY, jsonEncode(myFavoriteDatas));
  }

  Future<void> deleteMyFavoriteContent(String contentId) async {
    List? loadLocalStorageDatas = await loadFavoriteContents();
    if (loadLocalStorageDatas != null && loadLocalStorageDatas is List) {
      //배열이 null이 아닐경우에는
      //cid가 contentId와 같은 원소를 찾아서 리스트에서 삭제해준다음에
      //로컬스토리지에 새로운 밸류로 저장을 해준다.
      loadLocalStorageDatas.removeWhere((element) => element["cid"] == contentId);
    }
    updateFavoriteContent(loadLocalStorageDatas!);
  }
}
