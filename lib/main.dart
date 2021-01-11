import 'package:flutter/material.dart';
import 'package:simply_wifi/simply_wifi.dart';

void main() {
  runApp(MyApp());
}
  TextEditingController ssid = TextEditingController();
  TextEditingController pass = TextEditingController();

void _showDialog(BuildContext context, TextEditingController ssid) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: Text("input"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: ssid,
                decoration: InputDecoration(hintText: "SSID"),
              ),
              TextField(
                controller: pass,
                decoration: InputDecoration(hintText: "Password"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                FlatButton(onPressed: (){
                 SimplyWifi.connectWifi(ssid.toString(), pass.toString());
                 ssid.clear();pass.clear();
                 Navigator.pop(context);
                }, child: Text("Connect")),
                FlatButton(onPressed: (){
               Navigator.pop(context);
                }, child:Text("Cancel"))
              ],)
            ],
          ),
        );
      });
}

class MyApp extends StatelessWidget {


  //Future<List<WifiNetwork>> list;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestProject()
    );
  }
}

class TestProject extends StatelessWidget {
  const TestProject({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Simply Wifi"),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  SimplyWifi.turnOnWifi();
                },
                child: Text("On"),
              ),
              RaisedButton(
                onPressed: () {
                  SimplyWifi.turnOffWifi();
                },
                child: Text("Off"),
              ),
              RaisedButton(
                onPressed: () {
                  _showDialog(context, ssid);
                },
                child: Text("Connect"),
              ),
              RaisedButton(
                onPressed: () {
                  SimplyWifi.disconnectWifi();
                },
                child: Text("Disconnect"),
              )

              // RaisedButton(
              //   onPressed: () {
              //     list = SimplyWifi.getWifiList();
              //     ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: 1, //list.length==null?0:list.length,
              //         itemBuilder: (context, index) =>
              //             Text("${list.toString()}"));
              //   },
              //   child: Text("getList"),
              // ),
            ],
          ),
        ),
      );
  }
}