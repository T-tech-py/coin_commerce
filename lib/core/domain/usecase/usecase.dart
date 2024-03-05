
import 'package:either_dart/either.dart';
import '../entities/failure_result.dart';

mixin UseCase<DataType, Params> {
  Future<Either<FailureResult, DataType>> call(Params params);
}
