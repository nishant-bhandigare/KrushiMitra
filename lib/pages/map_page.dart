import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/scale_layer_plugin_option.dart';
import '../widgets/zoombuttons_plugin_option.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng center = const LatLng(19.38331, 72.83106);

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    final permissionStatus = await Permission.location.status;

    if (permissionStatus != PermissionStatus.granted) {
      await Permission.location.request();
    }

    if (permissionStatus == PermissionStatus.granted) {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        center = LatLng(position.latitude, position.longitude);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Nearby"),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: center,
              initialZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 35.0,
                    height: 35.0,
                    point: center,
                    child: const Icon(Icons.pin_drop),
                  ),
                ],
              ),
              ScaleLayerWidget(
                options: ScaleLayerPluginOption(
                  lineColor: Colors.blue,
                  lineWidth: 2,
                  textStyle: const TextStyle(color: Colors.blue, fontSize: 12),
                  padding: const EdgeInsets.all(10),
                ),
              ),
              const FlutterMapZoomButtons(
                minZoom: 4,
                maxZoom: 19,
                mini: true,
                padding: 10,
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}