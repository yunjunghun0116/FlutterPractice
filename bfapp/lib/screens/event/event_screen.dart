
import 'package:app/components/view/filter_bottom_sheet.dart';
import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/components/view/option_view.dart';
import 'package:app/components/view/list_bottom_sheet.dart';
import 'package:app/components/view/option_view_controller.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/controllers/bottom_sheet_controller.dart';
import 'package:app/controllers/location_controller.dart';
import 'package:app/enum/enum.dart';
import 'package:app/models/event/event_list_model.dart';
import 'package:app/screens/event/event_list_view.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/view/drop_down_button.dart';
import '../../enum/enum.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  final BottomSheetController _bottomSheetController = Get.put(BottomSheetController());
  final LocationController _locationController = Get.put(LocationController());
  final OptionViewController _gradeOptionController = OptionViewController();
  final OptionViewController _onOffOptionController = OptionViewController();
  final OptionViewController _regionOptionController = OptionViewController();

  @override
  void initState() {
    _tabController = TabController(
      length: 2, vsync: this,
    );
    _tabController.addListener(valueChangedTab);
    _bottomSheetController.titles = ['최신순', '거리순'];

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: NavigationBarView(
            title: '이벤트',
            type: NavigationType.main),
        body: Column(
          children: [
            TabBar(
                labelPadding: EdgeInsets.only(top: 20),
                controller: _tabController,
                indicatorColor: kBfb4875eColor,
                labelColor: kBfb4875eColor,
                unselectedLabelColor: Colors.grey[400],
                tabs: const [
                  SizedBox(height: 40,
                      child: Text("진행중")),
                  SizedBox(height: 40,
                      child: Text("종료"))
                ]
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("images/ic_filter.png"),
                            const Text("필터")
                          ],
                        ),
                        onPressed: () {
                          Get.bottomSheet(
                              FilterBottomSheet(
                                optionLists: [
                                  OptionView(
                                      controller: _gradeOptionController,
                                      title: '회원등급 (중복선택)',
                                      dataLists: memberGradeTypeToValues.values.toList(),
                                      filterType: FilterType.multi,
                                      changedValue: (index) {
                                      }),
                                  OptionView(
                                      controller: _onOffOptionController,
                                      title: '온라인/전시장',
                                      dataLists: onOffTypeToValues.values.toList(),
                                      filterType: FilterType.must,
                                      changedValue: (index) {
                                        _regionOptionController.isVisible = index == OnOffType.OFFLINE.index;
                                      }),
                                  OptionView(
                                      controller: _regionOptionController,
                                      title: '지역 (중복선택)',
                                      dataLists: regionTypeToValues.values.toList(),
                                      filterType: FilterType.multi,
                                      changedValue: (index) {
                                      })
                                ],
                                onTap: () {
                                  requestEventList();
                                },
                              )
                          );
                        }
                    ),
                    Obx(() { // DropDownButton 타이틀 갱신
                      var title = _bottomSheetController.titles[_bottomSheetController.index];
                      return MaterialButton(
                          child: DropDownButton(title: title),
                          onPressed: () {
                            Get.bottomSheet(ListBottomSheet(
                                onTap: (index) {
                                  setState(() {});
                                }
                            ));
                          });
                    }),
                  ],
                )
            ),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.vertical,
                  children: [
                    FutureBuilder(
                      future: requestEventList(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData) {
                          return Column(
                            children: eventChildren(snapshot.data),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                )
            )
          ],
        )
    );
  }

  Future<EventList> requestEventList() async {
    Map<String, dynamic> parameters = {
      'eventStatus' : _tabController.index == 0 ? 'ACTIVE' : 'END',
      'page': '0',
      'size': '20',
      'eventLineUpType': _bottomSheetController.index == 0 ? 'NEWEST' : 'DISTANCE',
      'progressType': 'ALL'
    };
    await _locationController.getLocation().then((value) {
      if (_bottomSheetController.index == 1) {
        parameters["addressLong"] = value.longitude;
        parameters["addressLat"] = value.latitude;
      }
    }).catchError((error) { });
    return NetworkUtils().getEventList(parameters);
  }

  List<Widget> eventChildren(EventList? response) {
    var content = response?.data?.content;
    if(content == null) return [Container()];

    return content.map((item) {
      return EventListView(
        eventContent: item,
      );
    }).toList();
  }

  void valueChangedTab() {
    if(_tabController.indexIsChanging) {
      setState(() {});
    }
  }

}