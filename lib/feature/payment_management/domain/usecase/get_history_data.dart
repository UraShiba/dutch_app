import 'package:dutch_app/core/failures.dart';
import 'package:dutch_app/core/no_input.dart';
import 'package:dutch_app/core/usecase.dart';
import 'package:dutch_app/feature/payment_management/domain/entities/history.dart';
import 'package:dutch_app/feature/payment_management/domain/repositories/history_repository.dart';
import 'package:either_dart/either.dart';

class GetHistoryUseCase extends UseCase<NoInput, List<History>> {
  final HistoryRepository repository;
  GetHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<History>>> call(NoInput input) {
    return repository.getHistoryData();
  }
}
