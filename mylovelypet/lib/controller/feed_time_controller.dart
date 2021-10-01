import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mypetmoments/model/feed_time.dart';

class FeedTimeController extends GetxController {
  //TODO 여기서 check를 진행해줄것
  static FeedTimeController get to => Get.find();
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  RxList feedTimes = [].obs;

  void getFeedTimes(String petId) async {
    var getLists = await _fireStore
        .collection(petId)
        .doc('feedTime')
        .collection('time')
        .get();
    List listDocs = getLists.docs;
    for(int i = 0; i < listDocs.length;i++){
      Map<String, dynamic> feedData = listDocs[i].data();
      String id = listDocs[i].id;
      String prev = feedData['previousTime'];
      String future = feedData['futureTime'];
      bool isFinished = feedData['isFinished'];
      FeedTime feedTimeData = FeedTime(
          id: id,
          previousTime: prev,
          futureTime: future,
          isFinished: isFinished);
      feedTimes.add(feedTimeData);
    }
  }
}
