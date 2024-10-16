import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetCheckPage extends StatefulWidget {
  @override
  _InternetCheckPageState createState() => _InternetCheckPageState();
}

class _InternetCheckPageState extends State<InternetCheckPage> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    var result = await _connectivity.checkConnectivity();
    setState(() {
      if (result.contains(ConnectivityResult.mobile)) {
        _connectionStatus = 'Mobile';
      } else if (result.contains(ConnectivityResult.wifi)) {
        _connectionStatus = 'Wifi';
      } else {
        _connectionStatus = 'No Internet';
      }
    });
  }

	
	 
 
		   
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificador Internet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
				 
            Text('Status da Conexão: $_connectionStatus'),
											 
			  
								 
				 
							  
											 
			  
								 
            ElevatedButton(
              onPressed: _checkConnection,
              child: Text('Verificar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
