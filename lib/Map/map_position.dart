import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../view/PostPage.dart';

class MapPosition extends StatefulWidget {
  @override
  State<MapPosition> createState() => MapPositionState();
}

class MapPositionState extends State<MapPosition> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.4537251, 126.7960716),
    zoom: 14.4746,
  );

  Future<LatLng> getCenter() async {
    final GoogleMapController controller = await _controller.future;
    LatLngBounds visibleRegion = await controller.getVisibleRegion();
    LatLng centerLatLng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );
    print("주소찾기 테스트222");
    print(centerLatLng);
    return centerLatLng;
  }

  List<Marker> _markers = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _markers.add(Marker(
  //       markerId: MarkerId("1"),
  //       draggable: true,
  //       onTap: () => print("Marker!"),
  //       position: LatLng(37.4537251, 126.7960716)));
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print("주소찾기 테스트");
          getCenter();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostPage()));
        },
        label: Text('위치 확인'),
      ),
    );
  }
}
