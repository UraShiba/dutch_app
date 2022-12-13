import 'package:dutch_app/history_page/history_page.dart';
import 'package:flutter/material.dart';
import 'package:dutch_app/bloc/history/history_cubit.dart';
import 'package:dutch_app/calculate_page/calculate_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: const Color(0xFFFEFEFF),
            appBar: AppBar(
              bottom: const TabBar(tabs: [
                Tab(
                    icon: Icon(
                  Icons.calculate,
                  color: Colors.blue,
                )),
                Tab(
                    icon: Icon(
                  Icons.history,
                  color: Colors.blue,
                )),
              ]),
              title: const Text(
                "Dutch app",
                style: TextStyle(color: Color(0xFF627893)),
              ),
              backgroundColor: const Color((0xFFF6F9FC)),
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