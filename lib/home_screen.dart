import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.48697447806926, 91.77714910271055),
    zoom: 14.4746,
    bearing: 0,
    tilt: 5,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Google Maps', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (LatLng position){
          print(position);
        },
        onLongPress: (LatLng latLng){
          print('On long press on $latLng');
        },
        onCameraMove: (cameraPosition){
          print(cameraPosition);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: {
          Marker(
            markerId: const MarkerId('initialPosition'),
            position: const LatLng(24.48268611180137, 91.77781943231821),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: const InfoWindow(
              title: 'This is title',
              snippet: 'This is snipet'
            ),
            draggable: true,
            onDragEnd: (LatLng position){
              print(position);
            },
            onDragStart: (LatLng position){
              print(position);
            },
            onDrag: (LatLng position){
              print(position);
            },
            onTap: (){
              print("on Tap in Map");
            }
          ),
          Marker(
              markerId: const MarkerId('initialPosition'),
              position: const LatLng(24.496008310270316, 91.77333109080791),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
              infoWindow: const InfoWindow(
                  title: 'This is title',
                  snippet: 'This is snipet'
              ),
              draggable: true,
              onDragEnd: (LatLng position){
                print(position);
              },
              onDragStart: (LatLng position){
                print(position);
              },
              onDrag: (LatLng position){
                print(position);
              },
              onTap: (){
                print("on Tap in Map");
              }
          ),
          Marker(
              markerId: const MarkerId('initialPosition'),
              position: const  LatLng(24.487435985384632, 91.78353689610958),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
              infoWindow: const InfoWindow(
                  title: 'This is title',
                  snippet: 'This is snipet'
              ),
              draggable: true,
              onDragEnd: (LatLng position){
                print(position);
              },
              onDragStart: (LatLng position){
                print(position);
              },
              onDrag: (LatLng position){
                print(position);
              },
              onTap: (){
                print("on Tap in Map");
              }
          ),
        },
        polylines: {
          Polyline(
            polylineId: PolylineId('basic-line'),
            color: Colors.red,
            width: 6,
            visible: true,
            endCap: Cap.roundCap,
            jointType: JointType.bevel,
            patterns: [
              PatternItem.dash(5),
              PatternItem.gap(5),
              PatternItem.dot
            ],
            points: [
              LatLng(24.48268611180137, 91.77781943231821),
              LatLng(24.496008310270316, 91.77333109080791),
              LatLng(24.487435985384632, 91.78353689610958),
              LatLng(24.48268611180137, 91.77781943231821),
            ]
          )
        },
        polygons: {
          Polygon(
            polygonId: PolygonId('basic-polygon'),
            visible: true,
            fillColor: Colors.pink,
            strokeColor: Colors.black,
            strokeWidth: 6,
            consumeTapEvents: true,
            onTap: (){
              print("Tapped on my area");
            },
            points: [
              LatLng(24.45782774382579, 91.77780367434025),
              LatLng(24.460079114357608, 91.7690248042345),
              LatLng(24.45208087478608, 91.76946368068457),
              LatLng(24.448230051191057, 91.77768532186747)
            ]
          )
        },
        circles: {
          Circle(
            circleId: CircleId("Basic-Circle"),
            center: LatLng(24.44572300015636, 91.7837243154645),
            radius: 300,
            fillColor: Colors.pink,
            strokeColor: Colors.black,
            strokeWidth: 6,
            consumeTapEvents: true,
            onTap: (){
              print("Tap on Circle");
            }
          )
        },
      ),
    );
  }
}