// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, camel_case_types, file_names, avoid_print, unused_import, undefined_shown_name

import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class Map_screen extends StatefulWidget {
  const Map_screen({Key? key}) : super(key: key);

  @override
  _Map_screenState createState() => _Map_screenState();
}

class _Map_screenState extends State<Map_screen> {
  late MapController  _mapController;
  double _rotation = 0;
  LatLng _currentLocation = LatLng(36.729719, 9.202851);
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController ();
    markers = [
      Marker(
        width: 80,
        height: 80,
        point: LatLng(36.726227, 9.187890),
        builder: (ctx) => Container(
          key: const Key('blue'),
          child: Image.asset(
            'icons/Marker.png',
            width: 80,
            height: 80,
          ),
        ),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(36.867240, 10.270650),
        builder: (ctx) => Container(
          key: const Key('blue'),
          child: Image.asset(
            'icons/Marker.png',
            width: 80,
            height: 80,
          ),
        ),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(36.806496, 10.181532),
        builder: (ctx) => Container(
          key: const Key('blue'),
          child: Image.asset(
            'icons/Marker.png',
            width: 80,
            height: 80,
          ),
        ),
      ),
    ];
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        markers.add(
          Marker(
            width: 80,
            height: 80,
            point: _currentLocation,
            builder: (ctx) => Container(
              key: const Key('blue'),
              child: Image.asset(
                'icons/Marker.png',
                width: 80,
                height: 80,
              ),
            ),
          ),
        );
      });
            _mapController.move(_currentLocation, 17);   
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'PERMISSION_DENIED') {
          print('Permission denied');
        }
      }
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text(
          'Carte',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          padding: const EdgeInsets.only(right: kDefaultPadding),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                color: kPrimaryColor,
                child: Row(
                  children: <Widget>[
                    Card(
                      color: kBackgroundColor,
                      child: MaterialButton(
                        onPressed: () {
                          _mapController.move(LatLng(36.726227, 9.187890), 15);
                        },
                        child: const Text('Beja'),
                      ),
                    ),
                    Card(
                      color: kBackgroundColor,
                      child: MaterialButton(
                        onPressed: () {
                          _mapController.move(LatLng(36.867240, 10.270650), 15);
                        },
                        child: const Text('Soukra'),
                      ),
                    ),
                    Card(
                      color: kBackgroundColor,
                      child: MaterialButton(
                        onPressed: () {
                          _mapController.move(LatLng(36.806496, 10.181532), 15);
                        },
                        child: const Text('tunis'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.gps_fixed),
                      onPressed: _getCurrentLocation,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Card(
                      color: kBackgroundColor,
                      child: MaterialButton(
                        onPressed: () {
                          final bounds = LatLngBounds.fromPoints([
                            LatLng(36.725890, 9.187340), //islaib
                            LatLng(36.867240, 10.270650), //soukra
                            LatLng(36.806496, 10.181532), //tunis
                          ]);

                          _mapController.fitBounds(
                            bounds,
                            options: FitBoundsOptions(
                              padding: EdgeInsets.only(left: 15, right: 15),
                            ),
                          );
                        },
                        child: const Text('Fit Bounds'),
                      ),
                    ),
                    Builder(builder: (BuildContext context) {
                      return Card(
                        color: kBackgroundColor,
                        child: MaterialButton(
                          onPressed: () {
                            final bounds = _mapController.bounds!;

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                'Map bounds:\n'
                                'East: ${bounds.east}\n'
                                'North: ${bounds.north}\n'
                                'West: ${bounds.west}\n'
                                'South: ${bounds.south}',
                              ),
                            ));
                          },
                          child: const Text('Get Bounds'),
                        ),
                      );
                    }),
                    Expanded(
                      child: Slider(
                        thumbColor: Colors.black,
                        activeColor: Colors.black,
                        inactiveColor: Colors.white,
                        value: _rotation,
                        min: 0,
                        max: 360,
                        onChanged: (degree) {
                          setState(() {
                            _rotation = degree;
                          });
                          _mapController.rotate(degree);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center: LatLng(36.860199, 10.190500),
                  zoom: 15,
                  maxZoom: 20,
                  minZoom: 3,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80,
                        height: 80,
                        point: _currentLocation,
                        builder: (ctx) => Container(
                          key: const Key('blue'),
                          child: Image.asset(
                            'icons/Marker.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      ...markers,
                    ],
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

class CustomMarker extends MarkerLayerOptions {
  CustomMarker({
    required LatLng point,
    required WidgetBuilder builder,
  }) : super(
          markers: [
            Marker(
              point: point,
              builder: builder,
            ),
          ],
        );
}
