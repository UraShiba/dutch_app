import 'package:dutch_app/core/configuration/style.dart';
import 'package:dutch_app/feature/payment_management/data/data_source/history_datasource.dart';
import 'package:dutch_app/feature/payment_management/data/repositories/history_repository_impl.dart';
import 'package:dutch_app/feature/payment_management/domain/usecase/get_history_data.dart';
import 'package:dutch_app/feature/payment_management/domain/usecase/set_history_data.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/history/history_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/history_page.dart';
import 'package:dutch_app/core/utils/shared_preference_provider.dart';
import 'package:flutter/material.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/calculate_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IosApp extends StatelessWidget {
  const IosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sharedPreferencesProvider = SharedPreferenceProvider();
    final historyDatasource = HistoryDatasource(sharedPreferencesProvider);
    final repository = HistoryRepositoryImpl(historyDatasource);
    final SetHistoryUsecase calculateUsecase = SetHistoryUsecase(repository);
    final GetHistoryUseCase getCalculateUseCase = GetHistoryUseCase(repository);
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
            bottomNavigationBar:
                const TabBar(indicatorColor: orangeColor, tabs: [
              Tab(icon: Icon(Icons.calculate, color: orangeColor)),
              Tab(icon: Icon(Icons.history, color: orangeColor)),
            ]),
            body: BlocProvider(
              create: (context) =>
                  HistoryCubit(calculateUsecase, getCalculateUseCase)
                    ..initHistory(),
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
