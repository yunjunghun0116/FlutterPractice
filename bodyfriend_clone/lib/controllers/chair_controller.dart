import 'package:bodyfriend_clone/models/chair.dart';
import 'package:get/get.dart';

class ChairController extends GetxController {
  static ChairController get to => Get.find();

  final List<Chair> _chairList = [
    Chair(
      id: '1',
      imageUrl: 'assets/images/image_1.jpeg',
      title: '팬텀메디컬케어\n(제이드그린)',
      price: 5800000,
      rentalPrice: 99500,
      point: 4.8,
      pointUser: [],
    ),
    Chair(
      id: '2',
      imageUrl: 'assets/images/image_2.jpeg',
      title: '더팬텀(카카오화이트)',
      price: 5400000,
      rentalPrice: 94500,
      point: 4.9,
      pointUser: [],
    ),
    Chair(
      id: '3',
      imageUrl: 'assets/images/image_3.jpeg',
      title: '더팬텀(블레이징블랙)',
      price: 5400000,
      rentalPrice: 94500,
      point: 4.8,
      pointUser: [],
    ),
  ];

  List<Chair> get chairList => _chairList;

  void addChair({
    required String title,
    required String imageUrl,
    required int price,
    required int rentalPrice,
  }) {
    _chairList.add(
      Chair(
        id: (_chairList.length + 1).toString(),
        imageUrl: imageUrl,
        title: title,
        price: price,
        rentalPrice: rentalPrice,
        point: 0,
        pointUser: [],
      ),
    );
    update();
  }


}
