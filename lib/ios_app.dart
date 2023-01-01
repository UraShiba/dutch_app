import 'package:dutch_app/configuration/style.dart';
import 'package:dutch_app/history_page/history_page.dart';
import 'package:flutter/material.dart';
import 'package:dutch_app/bloc/history/history_cubit.dart';
import 'package:dutch_app/calculate_page/calculate_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IosApp extends StatelessWidget {
  const IosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              title: const Text(
                "Dutch app",
                style: TextStyle(color: whiteColor),
              ),
              backgroundColor: orangeColor,
            ),
            bottomNavigationBar: const TabBar(tabs: [
              Tab(icon: Icon(Icons.calculate, color: whiteColor)),
              Tab(icon: Icon(Icons.history, color: whiteColor)),
            ]),
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
