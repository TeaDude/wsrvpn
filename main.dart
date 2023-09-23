import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

import 'vpn_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VpnModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('VPN App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Connected to VPN: ${Provider.of<VpnModel>(context).isConnected}'),
                ElevatedButton(
                  onPressed: () async {
                    // Watch an ad to connect to the VPN for 30 minutes.
                    await Provider.of<VpnModel>(context).connectToVpn();
                  },
                  child: Text('Connect to VPN'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
