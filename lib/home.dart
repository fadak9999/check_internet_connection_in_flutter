// ignore_for_file: avoid_print, camel_case_types

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

// ignore: duplicate_ignore

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _hmeState();
}

class _hmeState extends State<home> {
  //!
  @override
  void initState() {
    super.initState();
    Connectivity();
  }

  ////
  void checkConnect() async {
    var result = await Connectivity().checkConnectivity();
    print(result.name);
  }

  //!
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        //?
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          //
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber,
            ),
            body: snapshot.data == ConnectivityResult.none
                ? const Center(child: Text("No internet conection"))
                : const Center(child: Text("internet conection")),
          );
        });
  }
}
