import 'package:wifi_iot/wifi_iot.dart';

class SimplyWifi {
  static turnOnWifi() {
    WiFiForIoTPlugin.setEnabled(true);
    //WiFiForIoTPlugin.setWiFiAPEnabled(true);
    print("on");
  }

  static turnOffWifi() {
    WiFiForIoTPlugin.setEnabled(false);
    //WiFiForIoTPlugin.setWiFiAPEnabled(false);
    print("off");
  }

  static getWifiList() {
    return WiFiForIoTPlugin.loadWifiList();
    //print("List");
  }

  static connectWifi(String ssid, String pass) {
    
    WiFiForIoTPlugin.connect(ssid, password: pass,
    security: NetworkSecurity.WPA
    );
  }

  static disconnectWifi() {
    WiFiForIoTPlugin.disconnect();
  }
}
