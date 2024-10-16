import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';


class GyroscopeScreen extends StatefulWidget {
  @override
  _GyroscopeScreenState createState() => _GyroscopeScreenState();
}

class _GyroscopeScreenState extends State<GyroscopeScreen> {
  double x = 0.0, y = 0.0, z = 0.0;

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscópio em Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('X: $x'),
            Text('Y: $y'),
            Text('Z: $z'),
          ],
        ),
      ),
    );
  }
}
