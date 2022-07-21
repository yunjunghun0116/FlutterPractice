
import 'package:app/components/view/available_grade_view.dart';
import 'package:app/components/view/available_place_view.dart';
import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/constants/constants_url.dart';
import 'package:app/controllers/location_controller.dart';
import 'package:app/enum/enum.dart';
import 'package:app/models/event/event_detail_model.dart';
import 'package:app/models/event/event_list_model.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class EventDetailScreen extends StatelessWidget {
  final LocationController _locationController = Get.put(LocationController());

  RxInt _webViewHeight = 9999.obs;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: NavigationBarView(
            title: '이벤트 상세'),
        body: SafeArea(
            child: FutureBuilder(
              future: requestEventDetail(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.data == null) return const SizedBox();
                EventDetail response = snapshot.data;
                EventContent content = response.data;

                return SingleChildScrollView(
                    child: Column(
                          children: [
                            Container(child: Image(image:
                            NetworkImage(
                                content.mainImage ?? ''
                            ))),
                            Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(content.title ?? ''),
                                    Text(content.getDate()),
                                    AvailableGradeView(eventContent: content),
                                    AvailablePlaceView(eventContent: content)
                                  ],
                                )
                            ),
                            Obx(() => Container(
                              height: _webViewHeight.value.toDouble(),
                              child: loadWebView(content),
                            ))
                          ],
                      ),
                );
              },
            )
        )
    );
  }

  Future<EventDetail> requestEventDetail() async {
    Map<String, dynamic> parameters = {};
    await _locationController.getLocation().then((value) {
      parameters["addressLong"] = value.longitude;
      parameters["addressLat"] = value.latitude;
    }).catchError((error) { });
    return NetworkUtils().getEventDetail(Get.arguments, parameters);
  }

  Widget loadWebView(EventContent content) {
    return InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse('${detailWebUrl}id=${content.id}')),
        androidOnPermissionRequest:
            (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },
        onLoadStop: (controller, url) async {
          print('onLoadStop : $controller');
          var height = await controller.getContentHeight().then((value) {
            print('value : ${value}');
            if(_webViewHeight.value != value) {
              _webViewHeight.value = value!;
            }
          }).catchError((error) {
            print('catchError : $error');
          });
        }
    );
}
}


