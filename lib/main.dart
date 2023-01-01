import 'package:dutch_app/bloc/history/history_cubit.dart';
import 'package:dutch_app/calculate_page/calculate_page.dart';
import 'package:dutch_app/configuration/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_page/history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.calculate, color: whiteColor)),
                Tab(icon: Icon(Icons.history, color: whiteColor)),
              ]),
              title: const Text(
                "Dutch app",
                style: TextStyle(color: whiteColor),
              ),
              backgroundColor: orangeColor,
            ),
            body: BlocProvider(
              create: (context) => HistoryCubit(),
              child: const TabBarView(
                children: [
                  CalculatePage(),
                  HistoryPage(),
                ],
              ),
            )),
      ),
    );
  }
}
