import 'package:bluetooth/view_model/bluetooth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("Bluetooth App"),
      ),
      body: Consumer<BluetoothProvider>(
        builder: (_,obj, __) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListView.builder(
                  physics:const ScrollPhysics() ,
                    shrinkWrap: true,
                    itemCount: obj.bluetoothDevices.length,
                    itemBuilder: (context, index){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${obj.bluetoothDevices[index]["id"]}|${obj.bluetoothDevices[index]["name"]}"),
                          ElevatedButton(onPressed: (){}, child: const Text("Connect"))
                        ],
                      );
                    }),
                ElevatedButton(onPressed: (){
                  obj.isScanning?
                  obj.stopScanning(): obj.startScanning();
                }, child:   obj.isScanning? const Text("Stop Scanning"): const Text("Scanning"))
              ],
            ),
          );
        }
      )

    );
  }
}
