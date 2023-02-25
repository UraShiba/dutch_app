import 'package:dutch_app/core/failures.dart';
import 'package:dutch_app/core/no_output.dart';
import 'package:dutch_app/feature/payment_management/domain/entities/history.dart';
import 'package:either_dart/either.dart';

abstract class HistoryRepository {
  Future<Either<Failure, NoOutput>> setHistoryData(List<History> history);
  Future<Either<Failure, List<History>>> getHistoryData();
}
