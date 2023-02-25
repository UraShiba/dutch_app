import 'package:dutch_app/core/failures.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<InputType, OutputType> {
  Future<Either<Failure, OutputType>> call(InputType input);
}
