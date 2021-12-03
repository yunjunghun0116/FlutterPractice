import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kakaologinandgooglemaps/components/big_map.dart';
import 'package:kakaologinandgooglemaps/controllers/pick_location_controller.dart';
import 'package:kakaologinandgooglemaps/models/picked_location.dart';
import 'package:kakaologinandgooglemaps/utils/google_map_services.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({Key? key}) : super(key: key);

  @override
  _PickLocationScreenState createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  GlobalKey<FormBuilderState> _fbkey = GlobalKey<FormBuilderState>();
  PickedLocation? pickedLocation;
  String? mapImageUrl;
  bool mapLoading = false;
  Map<String, dynamic>? pickedLocationMap;
  final TextEditingController _addressController = TextEditingController();

  void _submit() {
    _fbkey.currentState!.save();
    final inputValues = _fbkey.currentState!.value;
    PickedLocation newLocation = PickedLocation(
      id:inputValues['comment'],
     comment: inputValues['comment'],
      address: inputValues['Address'],
      lat: pickedLocationMap!['latitude'],
      lng: pickedLocationMap!['longitude'],
   );
    PickLocationController.to.addLocation(newLocation).then((value)=>Get.back());
  }

  void _pickLocation() async {
    pickedLocationMap =
        await Get.to(() => const BigMap(), fullscreenDialog: true);
    if (pickedLocationMap == null) {
      return;
    }
    setState(() {
      mapLoading = true;
    });
    final staticMapImageUrl = GoogleMapServices.getStaticMap(
      pickedLocationMap!['latitude'],
      pickedLocationMap!['longitude'],
    );

    setState(() {
      _addressController.text = pickedLocationMap!['address'];
      mapImageUrl = staticMapImageUrl;
      mapLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Location Screen'),
        actions: [
          IconButton(onPressed: (){
            _submit();
          }, icon:const  Icon(Icons.check),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
              key: _fbkey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Pick Important place',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: FormBuilderTextField(
                      name: 'comment',
                      decoration: const InputDecoration(
                        labelText: 'Comment',
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: FormBuilderTextField(
                      controller: _addressController,
                      readOnly: true,
                      name: 'Address',
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.grey[100],
                    ),
                    child: mapImageUrl != null
                        ? mapLoading
                            ? const CircularProgressIndicator()
                            : Image.network(
                                mapImageUrl!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  ),
                                  iconSize: 96,
                                ),
                                const Text('장소를 선택하려면 + 아이콘을 탭하세요'),
                              ],
                            ),
                          ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pickLocation();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.check),
                        SizedBox(width: 20),
                        Text(
                          'Pick Location',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
