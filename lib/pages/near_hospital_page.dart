import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//AIzaSyApjFvgIoBDAor1gixmmu9exDGWh00oBNg
//

class NearHospital extends StatefulWidget {
  final Key _mapKey = UniqueKey();

  @override
  _NearHospitalState createState() => _NearHospitalState();
}

class _NearHospitalState extends State<NearHospital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'NearBy Hospitals',
          style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,),
        body: TheMap(key: widget._mapKey));
  }
}

class TheMap extends StatefulWidget {
  ///key is required, otherwise map crashes on hot reload
  TheMap({@required Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TheMap> {
  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
  BitmapDescriptor _markerIcon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //also this avoids it crashing/breaking when the keyboard is up
      resizeToAvoidBottomInset: false,
      body: Container(
          child: GoogleMap(
            markers: _createMarker(),
        compassEnabled: true,
        myLocationButtonEnabled: true,
        mapToolbarEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(28.5672, 77.2100),
          zoom: 11.0,
        ),
      )),
    );
  }
  Set<Marker> _createMarker() {
    // TODO(iskakaushik): Remove this when collection literals makes it to stable.
    // https://github.com/flutter/flutter/issues/28312
    // ignore: prefer_collection_literals
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: const LatLng(28.5672, 77.2100) ,
        icon: _markerIcon,
      ),
    ].toSet();
  }
}
