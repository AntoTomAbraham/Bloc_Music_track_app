import 'package:bloc_music/Screens/Homepage.dart';
import 'package:bloc_music/model/Saved.dart';
import 'package:bloc_music/network/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SavedAdapter());
  //await Hive.openBox('save_box');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: BlocProvider<NetworkBloc>(
            create: (context) => NetworkBloc()..add(ListenConnection()),
            child: BlocBuilder<NetworkBloc, NetworkState>(
                builder: ((context, state) {
              if (state is ConnectionSuccess) {
                return Homepage();
              }
              if (state is ConnectionFailure) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      "No Internet Connection",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              } else {
                return Text("");
              }
            }))));
  }
}
