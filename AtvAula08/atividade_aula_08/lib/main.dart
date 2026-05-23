import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrentLocationWebMapPage(),
    );
  }
}

class CurrentLocationWebMapPage extends StatefulWidget {
  const CurrentLocationWebMapPage({super.key});

  @override
  State<CurrentLocationWebMapPage> createState() =>
      _CurrentLocationWebMapPageState();
}

class _CurrentLocationWebMapPageState extends State<CurrentLocationWebMapPage> {
  GoogleMapController? _mapController;
  LatLng? _currentLatLng;
  bool _loading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadCurrentLocation();
  }

  Future<void> _loadCurrentLocation() async {
    try {
      final position = await _determinePosition();
      final latLng = LatLng(position.latitude, position.longitude);

      setState(() {
        _currentLatLng = latLng;
        _loading = false;
        _errorMessage = null;
      });

      await _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 16),
        ),
      );
    } catch (e) {
      setState(() {
        _loading = false;
        _errorMessage = e.toString();
      });
    }
  }

  Future<Position> _determinePosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Serviço de localização desativado.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permissão de localização negada.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Permissão de localização negada permanentemente.');
    }

    return Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final initialTarget = _currentLatLng ?? const LatLng(-23.55052, -46.633308);

    final markers = <Marker>{
      if (_currentLatLng != null)
        Marker(
          markerId: const MarkerId('current_location'),
          position: _currentLatLng!,
          infoWindow: const InfoWindow(title: 'Minha localização'),
        ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha localização no mapa'),
        actions: [
          IconButton(
            onPressed: _loadCurrentLocation,
            icon: const Icon(Icons.my_location),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: initialTarget,
                    zoom: _currentLatLng == null ? 12 : 16,
                  ),
                  markers: markers,
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                ),
    );
  }
}