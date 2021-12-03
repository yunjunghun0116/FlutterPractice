import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakaologinandgooglemaps/controllers/pick_location_controller.dart';
import 'package:kakaologinandgooglemaps/models/picked_location.dart';
import 'package:kakaologinandgooglemaps/utils/google_map_services.dart';

class PlaceWithLocationScreen extends StatefulWidget {
  const PlaceWithLocationScreen({Key? key}) : super(key: key);

  @override
  State<PlaceWithLocationScreen> createState() =>
      _PlaceWithLocationScreenState();
}

class _PlaceWithLocationScreenState extends State<PlaceWithLocationScreen> {
  PickLocationController controller = PickLocationController.to;

  List<PickedLocation> locations = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocations();
  }

  void _getLocations() {
    try {
      setState(() {
        isLoading = true;
      });
      controller.getLocations().then((value) {
        setState(() {
          locations = controller.pickedLocations;
          isLoading = false; //6-2 7:17
        });
      });
    } catch (e) {
      print(e);
    }
  }

  void _deleteLocation(PickedLocation location) async {
    try {
      setState(() {
        isLoading = true;
      });
      controller.deleteLocation(location.id).then((value) {
        setState(() {
          isLoading = false; //6-2 7:17
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Location'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/picklocation');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: !isLoading
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: locations.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(locations[index].address),
                        subtitle: Text(locations[index].comment),
                        trailing: IconButton(
                          onPressed: (){
                            _deleteLocation(locations[index]);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String s =
                          GoogleMapServices.getStaticMap(36.59288, 127.29237);
                      print(s);
                    },
                    child: const Text('check'),
                  ),
                ],
              ),
            )
          : const Center(
              child: const CircularProgressIndicator(),
            ),
    );
  }
}
