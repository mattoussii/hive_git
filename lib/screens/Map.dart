// ignore_for_file: prefer_const_constructors, camel_case_types, library_private_types_in_public_api, avoid_print, prefer_final_fields, file_names

// import 'dart:async';
import 'dart:async';

import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';


class Map_screen extends StatefulWidget {
  static const String route = 'map_controller';

  const Map_screen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<Map_screen> {
 
  late MapController _mapController;
  double _rotation = 0;
  LatLng _currentLocation = LatLng(36.729719, 9.202851);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

  }



  @override
  Widget build(BuildContext context) {
    final markers = <Marker>[
      //marker current position
      Marker(
      width: 80,
      height: 80,
        point: LatLng(36.729719, 9.202851),
        builder: (ctx) => Container(
          key: const Key('blue'),
          child:Image.asset(
      'icons/Marker.png', 
      width: 80,
      height: 80,
    ),
        ),
      ),
    
    //marker beja
      Marker(
      width: 80,
      height: 80,
        point: LatLng(36.726227, 9.187890),
        builder: (ctx) => Container(
          key: const Key('blue'),
          child:Image.asset(
      'icons/Marker.png', 
      width: 80,
      height: 80,
    ),
        ),
      ),
    //marker soukra
     Marker(
      width: 80,
      height: 80,
        point: LatLng(36.867240, 10.270650),
        builder: (ctx) => Container(
          key: const Key('blue'),
          child:Image.asset(
      'icons/Marker.png', 
      width: 80,
      height: 80,
    ),
        ),
      ),

     //marker tunis
     Marker(
      width: 80,
      height: 80,
        point: LatLng(36.806496, 10.181532),
        builder: (ctx) => Container(
          key: const Key('blue'),
          child:Image.asset(
      'icons/Marker.png', 
      width: 80,
      height: 80,
    ),
        ),
      ),


    ];

    return Scaffold(
            appBar: AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'Carte ',
         style: GoogleFonts.robotoCondensed(
                   fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
                  ),),
      centerTitle: false,
         leading: IconButton(
        padding: const EdgeInsets.only(right:kDefaultPadding ),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          ),
        onPressed: (){
         
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>HomeScreen() 
          ));
        },
      ),

    ),
    
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            /////////
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
                      icon: Icon(Icons.gps_fixed , color: Colors.black,),
                      onPressed: () {
                        _mapController.move(_currentLocation, 17);
                        
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            //////////
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
                            LatLng(36.867240, 10.270650),//soukra
                            LatLng(36.806496, 10.181532),//tunis
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
            
            ///////////
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
                  MarkerLayerOptions(markers: markers),
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

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({
    Key? key,
    required this.mapController,
  }) : super(key: key);

  final MapController mapController;

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  int _eventKey = 0;

  IconData icon = Icons.gps_not_fixed;
  late final StreamSubscription<MapEvent> mapEventSubscription;

  @override
  void initState() {
    super.initState();
    mapEventSubscription =
        widget.mapController.mapEventStream.listen(onMapEvent);
  }

  @override
  void dispose() {
    mapEventSubscription.cancel();
    super.dispose();
  }

  void setIcon(IconData newIcon) {
    if (newIcon != icon && mounted) {
      setState(() {
        icon = newIcon;
      });
    }
  }

  void onMapEvent(MapEvent mapEvent) {
    if (mapEvent is MapEventMove && mapEvent.id != _eventKey.toString()) {
      setIcon(Icons.gps_not_fixed);
    }
  }

  void _moveToCurrent() async {
    _eventKey++;
    final location = Location();

    try {
      final currentLocation = await location.getLocation();
      final moved = widget.mapController.move(
        LatLng(currentLocation.latitude!, currentLocation.longitude!),
        18,
        id: _eventKey.toString(),
      );

      setIcon(moved ? Icons.gps_fixed : Icons.gps_not_fixed);
    } catch (e) {
      setIcon(Icons.gps_off);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon), 
       onPressed: _moveToCurrent,
    );
  }
}
