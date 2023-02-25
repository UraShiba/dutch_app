import 'package:dutch_app/core/failures.dart';
import 'package:dutch_app/core/no_output.dart';
import 'package:dutch_app/feature/payment_management/data/data_source/history_datasource.dart';
import 'package:dutch_app/feature/payment_management/data/models/history_model.dart';
import 'package:dutch_app/feature/payment_management/domain/entities/history.dart';
import 'package:dutch_app/feature/payment_management/domain/repositories/history_repository.dart';
import 'package:either_dart/either.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final HistoryDatasource historyDatasource;

  HistoryRepositoryImpl(this.historyDatasource);

  @override
  Future<Either<Failure, NoOutput>> setHistoryData(
      List<History> history) async {
    try {
      final historyModel = history
          .map((history) => HistoryModel(
              dateTime: history.dateTime,
              memberName: history.memberName,
              money: history.money))
          .toList();

      await historyDatasource.setHistoryStatus(historyModel);
      return Right(NoOutput());
    } on Exception {
      return const Left(LocalStorageFailure());
    }
  }

  @override
  Future<Either<Failure, List<History>>> getHistoryData() async {
    try {
      final result = await historyDatasource.getHistoryStatus();
      return Right(result);
    } on Exception {
      return const Left(LocalStorageFailure());
    }
  }
}
