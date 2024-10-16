import 'package:app_recursos/PhotoPickerPage.dart';
import 'package:app_recursos/acelerometro.dart';
import 'package:app_recursos/giroscopio.dart';
import 'package:app_recursos/gpsPage.dart';
import 'package:app_recursos/internet.dart';
import 'package:app_recursos/jogodavelhaia.dart';
import 'package:app_recursos/teste.dart';
import 'package:app_recursos/whatsapp.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.network_check),
              title: Text('Verificar Internet'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InternetCheckPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.gps_fixed),
              title: Text('Acessar GPS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GpsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Acessar Galeria/Câmera'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhotoPickerPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.games),
              title: Text('Jogo da Velha com IA'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicTacToe()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.sensors),
              title: Text('Giroscópio'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GyroscopeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.sensors),
              title: Text('Acelerômetro'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccelerometerScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Enviar Mensagem WhatsApp'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => whatsappMessagem()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('teste'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicTacToeteste()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bem-vindo à tela Home!'),
      ),
    );
  }
}
