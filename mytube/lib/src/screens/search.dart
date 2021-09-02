import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mytube/src/components/app_video_widget.dart';
import '../controller/app_video_search_controller.dart';

class Search extends GetView<YoutubeSearchController> {
  final fieldTextEditingController = TextEditingController();

  Widget _searchHistory() {
    return ListView(
      children: List.generate(
        controller.history.length,
        (index) => ListTile(
          onTap: () {
            controller.search(controller.history[index]);
          },
          leading: SvgPicture.asset(
            'assets/svg/icons/wall-clock.svg',
            width: 20.0,
          ),
          title: Text(controller.history[index]),
          trailing: Icon(
            Icons.arrow_forward,
            size: 20.0,
          ),
        ),
      ).toList(),
    );
  }

  Widget _searchResultView() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: List.generate(
          controller.youtubeSearchResult.value.items!.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(
                    '/detail/${controller.youtubeSearchResult.value.items![index].id!.videoId}');
              },
              child: AppVideoWidget(
                  video: controller.youtubeSearchResult.value.items![index]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/icons/back.svg'),
          onPressed: () {
            Get.back();
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            fillColor: Colors.grey.withOpacity(0.2),
            filled: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          controller: fieldTextEditingController,
          onSubmitted: (value) {
            controller.search(value);
            fieldTextEditingController.clear();
          },
          enableSuggestions: false,
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.mic),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.youtubeSearchResult.value.items != null) {
          return _searchResultView();
        }
        return _searchHistory();
      }),
    );
  }
}
