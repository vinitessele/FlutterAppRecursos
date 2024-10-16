import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsPage extends StatefulWidget {
  @override
  _GpsPageState createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  String _locationMessage = "Localização não disponível";

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Serviço de localização desativado";
      });
      return;
    }

    // Verifica se as permissões estão concedidas
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = "Permissão de localização negada";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage =
            "Permissão de localização permanentemente negada, não podemos solicitar permissões.";
      });
      return;
    }

    // Obtém a localização atual
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationMessage = "Localização atual: ${position.latitude}, ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acessar GPS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_locationMessage),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text('Obter Localização Atual'),
            ),
          ],
        ),
      ),
    );
  }
}
