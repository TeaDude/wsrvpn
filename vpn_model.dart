import 'package:network_info/network_info.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class VpnModel extends ChangeNotifier {
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  Future<void> connectToVpn() async {
    // Watch an ad.
    final adBrowser = InAppBrowser(
      initialUrl: 'https://example.com/ad',
    );
    await adBrowser.open();

    // Connect to the VPN for 30 minutes.
    final networkInfo = NetworkInfo();
    final vpnInterface = await networkInfo.getVPNInterface();
    await vpnInterface.connect('example.com', 'vpn_username', 'vpn_password');

    // Set the _isConnected flag to true.
    _isConnected = true;
    notifyListeners();

    // Disconnect from the VPN after 30 minutes.
    Future.delayed(Duration(minutes: 30), () async {
      await vpnInterface.disconnect();
      _isConnected = false;
      notifyListeners();
    });
  }
}
