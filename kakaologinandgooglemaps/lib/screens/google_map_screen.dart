import 'package:flutter/material.dart';
import 'package:kakaologinandgooglemaps/components/google_map.dart';
import 'package:kakaologinandgooglemaps/screens/place_auto_complete_screen.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);
  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Google Map Screen'),
              const GoogleMapsFlutter(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const PlaceAutoCompleteScreen();
                    }));
                  },
                  child: const Text('Place Auto complete')),
            ],
          ),
        ),
      ),
    );
  }
}
