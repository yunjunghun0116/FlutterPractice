//  DB로부터 데이터를 PetMoment형식으로 다 가져와서 로드해줄것이기때문에 모델이 필요하고
class PetMoment {
  //여기서 id는 데이터 저장했을때 이미지를 구분하기위한 작업 & changeComment를 해줄때 사용될 id
  String id;
  String imageUrl;
  String date;
  String place;
  String comment;

  PetMoment(
      {required this.id,required this.imageUrl, required this.date, required this.place,required this.comment});

  void changeComment(String s){
    this.comment = s;
    //TODO 변경된 comment를 새로 저장해주는 방식
  }

  String get momentImageUrl => imageUrl;
  String get momentDate => date;
  String get momentPlace => place;
  String get momentComment => comment;
}
