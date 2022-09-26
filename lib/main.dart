import 'package:bluetooth/view/home.dart';
import 'package:bluetooth/view_model/bluetooth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => BluetoothProvider()),
          ],
     child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: MyHomePage()
      // StreamBuilder<BluetoothState>(
      //     stream: FlutterBlue.instance.state,
      //     initialData: BluetoothState.unknown,
      //     builder: (c, snapshot) {
      //       final state = snapshot.data;
      //       if (state == BluetoothState.on) {
      //         return FindDevicesScreen();
      //       }
      //       return BluetoothOffScreen(state: state);
      //     }),
    );
  }
}

