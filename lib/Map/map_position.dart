import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPosition extends StatefulWidget {
  @override
  State<MapPosition> createState() => MapPositionState();
}

class MapPositionState extends State<MapPosition> {
  Position position;
  Completer<GoogleMapController> _controller = Completer();
  LatLng selectedLocation;
  bool loading = false;
  String selectedAddress;

  @override
  void initState() {
    super.initState();
    _setInitialPostion();
  }

  _setInitialPostion() async {
    position = await Geolocator().getCurrentPosition();
    setState(() {});
  }

  _selectLocation(LatLng loc) async {
    setState(() => loading = true);
    selectedAddress = await GoogleMapServices.getAddrFromLocation(
        loc.latitude, loc.longitude);
    setState(() {
      loading = false;
      selectedLocation = loc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose from map'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: selectedLocation == null
                ? null
                : () => Navigator.of(context).pop({
                      'latitude': selectedLocation.latitude,
                      'longitude': selectedLocation.longitude,
                      'address': selectedAddress,
                    }),
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: position == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                onTap: _selectLocation,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    position.latitude,
                    position.longitude,
                  ),
                  zoom: 16,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: selectedLocation == null
                    ? null
                    : {
                        Marker(
                          markerId: MarkerId('selectedLocation'),
                          position: selectedLocation,
                          infoWindow: InfoWindow(
                            title: '선택된 위치',
                            snippet: selectedAddress,
                          ),
                        ),
                      },
              ),
      ),
    );
  }
}