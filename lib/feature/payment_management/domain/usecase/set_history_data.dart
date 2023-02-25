import 'package:dutch_app/core/failures.dart';
import 'package:dutch_app/core/no_output.dart';
import 'package:dutch_app/core/usecase.dart';
import 'package:dutch_app/feature/payment_management/data/models/history_model.dart';
import 'package:dutch_app/feature/payment_management/domain/entities/history.dart';
import 'package:dutch_app/feature/payment_management/domain/repositories/history_repository.dart';
import 'package:either_dart/either.dart';

class SetHistoryUsecase extends UseCase<List<HistoryModel>, NoOutput> {
  final HistoryRepository repository;
  SetHistoryUsecase(this.repository);

  @override
  Future<Either<Failure, NoOutput>> call(List<History> input) {
    return repository.setHistoryData(input);
  }
}
