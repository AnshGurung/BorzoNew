import 'dart:async';

import 'package:borzo_app/Screens/NewOrderScreen/Points/delivery_point.dart';
import 'package:borzo_app/Screens/NewOrderScreen/new_order_screen.dart';
import 'package:borzo_app/Screens/OrderScreen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_geocoder/geocoder.dart';

class LocationMap extends StatefulWidget {
  LocationMap({
    super.key,
    required this.isDeliverNow,
    required this.isSchedule,
    required this.locationController,
    this.ispickupPoint,
  });

  bool isDeliverNow;
  bool isSchedule;
  TextEditingController locationController;
  bool? ispickupPoint;

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  //TextEditingController controller;
  final Completer<GoogleMapController> _controller = Completer();
  static const double latitude = 19.0760;
  static const double longitude = 72.8777;

  static const CameraPosition defaultLocation =
      CameraPosition(target: LatLng(latitude, longitude), zoom: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onTap: (LatLng latlong) async {
              final coordinates =
                  Coordinates(latlong.latitude, latlong.longitude);
              var address = await Geocoder.local
                  .findAddressesFromCoordinates(coordinates);

              var first = address.first;
              setState(
                () {
                  widget.ispickupPoint != null
                      ? Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewOrderScreen(
                              pickupLocation: first.featureName.toString() +
                                  first.addressLine.toString(),
                            ),
                          ),
                          (route) => route.isFirst,
                        )
                      : Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewOrderScreen(
                              location: first.featureName.toString() +
                                  first.addressLine.toString(),
                            ),
                          ),
                          (route) => route.isFirst,
                        );
                },
              );
            },
            initialCameraPosition: defaultLocation,
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
          ),
          const Center(
            child: Icon(
              Icons.location_pin,
              color: Colors.black,
              size: 40,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
