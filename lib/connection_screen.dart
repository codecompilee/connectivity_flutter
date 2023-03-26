import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectivityResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Connectivity Modes",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/gif/${_connectivityResult.name == 'none' ? 'no_connection' : 'connection'}.gif',
            height: 300,
          ),
          Center(
            child: Text(
              "${_connectivityResult.name} Connection".toUpperCase(),
              style: const TextStyle(
                  fontSize: 30,
                  shadows: [
                    Shadow(color: Colors.black38, offset: Offset(1, 1))
                  ],
                  fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }
}
