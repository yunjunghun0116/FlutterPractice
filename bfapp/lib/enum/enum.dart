
class EnumData {
  final String name;
  final String key;

  EnumData({required this.name, required this.key});
}

enum NavigationType {
  back,       // 뒤로가기 Default
  close,      // 닫기
  main,       // 제일 상단 페이지
  user        // 메뉴 유저정보
}

enum NavigationButtonType {
  guide,            // 이용가이드
  information,      // 주문/배송 절차
  notification,     // 알림
  search,           // 제품검색
  cart,             // 장바구니
  grade,            // 등급 안내
  setting           // 설정
}

enum FilterType {
  justOne,          // 단일 선택 버튼
  must,             // 선택 필수 버튼
  multi,            // 다중 선택 버튼
}

enum MemberGradeType { BASIC, FRIEND, FAMILY, VIP, LVIP }

extension MemberGradeTypeData on MemberGradeType {
  static final _data = {
    MemberGradeType.BASIC: EnumData(name: 'BASIC', key: 'BASIC'),
    MemberGradeType.FRIEND: EnumData(name: 'FRIEND', key: 'FRIEND'),
    MemberGradeType.FAMILY: EnumData(name: 'FAMILY', key: 'FAMILY'),
    MemberGradeType.VIP: EnumData(name: 'VIP', key: 'VIP'),
    MemberGradeType.LVIP: EnumData(name: 'LVIP', key: 'LVIP'),
  };

  String get name => _data[this]!.name;
  String get key => _data[this]!.key;
}

final Map memberGradeTypeValues = {
  "BASIC": MemberGradeType.BASIC,
  "FRIEND": MemberGradeType.FRIEND,
  "FAMILY": MemberGradeType.FAMILY,
  "VIP": MemberGradeType.VIP,
  "LVIP": MemberGradeType.LVIP
};

final memberGradeTypeToValues = {
  MemberGradeType.BASIC: 'BASIC',
  MemberGradeType.FRIEND: 'FRIEND',
  MemberGradeType.FAMILY: 'FAMILY',
  MemberGradeType.VIP: 'VIP',
  MemberGradeType.LVIP: 'LVIP',
};

enum OnOffType { ALL, ONLINE, OFFLINE }

extension OnOffTypeData on MemberGradeType {
  static final _data = {
    OnOffType.ALL: EnumData(name: '전체', key: 'ALL'),
    OnOffType.ONLINE: EnumData(name: '온라인', key: 'ONLINE'),
    OnOffType.OFFLINE: EnumData(name: '전시장', key: 'OFFLINE'),
  };

  String get name => _data[this]!.name;
  String get key => _data[this]!.key;
}

final Map onOffTypeToValues = {
  OnOffType.ALL: '전체',
  OnOffType.ONLINE: '온라인',
  OnOffType.OFFLINE: '전시장'
};
String? onOffTypeValue(OnOffType value) => onOffTypeToValues[value];

enum RegionType { SEOUL, GYEONGGI, INCHEON, GANGWON, CHUNGCHEONG, GYEONGSANG, JEOLLA, JEJU }
final Map regionTypeToValues = {
  RegionType.SEOUL: '전체',
  RegionType.GYEONGGI: '경기',
  RegionType.INCHEON: '인천',
  RegionType.GANGWON: '강원',
  RegionType.CHUNGCHEONG: '충청',
  RegionType.GYEONGSANG: '경상',
  RegionType.JEOLLA: '전라',
  RegionType.JEJU: '제주',
};