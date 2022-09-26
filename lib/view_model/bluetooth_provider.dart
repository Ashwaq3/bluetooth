
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothProvider with ChangeNotifier{
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  List bluetoothDevices = [];
  bool isScanning = false;

  startScanning() async{

    // Start scanning
    await flutterBlue.startScan(timeout: const Duration(seconds: 4), scanMode: ScanMode.balanced);
    isScanning =true;
    notifyListeners();
// Listen to scan results
flutterBlue.scanResults.listen((results) {
      // do something with scan results
      List devices = [];
      for (ScanResult r in results) {
        devices.add({"id":r.device.id, "name": r.advertisementData.localName});
        print('${r.device.type} || ${r.device.state}');
      }

      bluetoothDevices = devices;
      notifyListeners();
    });
  }

  stopScanning(){

    flutterBlue.stopScan();
    isScanning =false;
    notifyListeners();

  }
}