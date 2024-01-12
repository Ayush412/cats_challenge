import 'package:cats_challenge/features/facts/models/cat_fact.dart';

import '../../../core/util/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class IFactsRepository {
  Future<Either<Failure, CatFact>> getRandomFact();
  Future<Either<Failure, List<CatFact>>> getFacts(int page);
}
