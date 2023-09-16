import 'dart:async';
import 'package:location/location.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:plati_online/data/map_data.dart';
import 'package:plati_online/key.dart';

/// Represents a Flutter widget for displaying a map with markers.
class MapSample extends StatefulWidget {
  final String _keyword;

  const MapSample(this._keyword, {super.key});

  @override
  State<MapSample> createState() => MapSampleState(_keyword);
}

/// Represents the state for the map widget.
class MapSampleState extends State<MapSample> {
  Set<Marker> markers = {};
  final String _radius = "10000";
  final String _apiKey = Keys.googleMapsKey;
  final String _skopjeLocation = "41.99646,21.43141";
  final String _keyword;
  Location location = Location();

  MapSampleState(this._keyword);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _skopje = CameraPosition(
    target: LatLng(41.99646, 21.43141),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    location = Location();
    makeHttpPost();
  }

  /// Makes an HTTP POST request to retrieve data from Google Places API
  /// based on the current location and a keyword.
  void makeHttpPost() async {
    String currentLocationString = "";
    String keyword = "$_keyword near me";

    LocationData? locationData = await getLocation();
    if (locationData != null) {
      LatLng currentLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
      currentLocationString =
          "${currentLocation.latitude},${currentLocation.longitude}";
      Marker marker = Marker(
          markerId: const MarkerId("currentLocation"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          infoWindow: const InfoWindow(title: "My location"),
          position: currentLocation);
      markers.add(marker);

      GoogleMapController googleMapController = await _controller.future;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLocation, zoom: 12)));
    }

    if (currentLocationString.isEmpty) {
      currentLocationString = _skopjeLocation;
    }

    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$currentLocationString&radius=$_radius&key=$_apiKey&keyword=$keyword");

    var responce = await http.post(url);
    PlacesApiResults placesApiResults =
        PlacesApiResults.fromRawJson(responce.body);

    if (placesApiResults.status == "OK" && placesApiResults.results != null) {
      List<Result> results = placesApiResults.results!;
      for (int i = 0; i < results.length; i++) {
        Marker marker = Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(
            results[i].geometry!.location!.lat!,
            results[i].geometry!.location!.lng!,
          ),
          infoWindow: InfoWindow(title: results[i].name),
        );

        markers.add(marker);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: markers,
        initialCameraPosition: _skopje,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _back,
        label: const Text('Назад'),
      ),
    );
  }

  /// Handles the 'Назад' (Back) button press to navigate back to the previous screen.
  Future<void> _back() async {
    Navigator.of(context).pop(true);
  }

  /// Retrieves the current location using the Location package.
  Future<LocationData?> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();

    return locationData;
  }
}
