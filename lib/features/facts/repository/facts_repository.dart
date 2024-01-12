import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:cats_challenge/core/database/sembast_db.dart';
import 'package:cats_challenge/core/util/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:cats_challenge/features/facts/models/cat_fact.dart';
import 'package:logger/logger.dart';
import 'i_facts_repository.dart';

@LazySingleton(as: IFactsRepository)
class FactsRepository implements IFactsRepository {
  FactsRepository(this._dio, this._logger);
  final Dio _dio;
  final Logger _logger;

  @override
  Future<Either<Failure, CatFact>> getRandomFact() async {
    try {
      final response = await _dio.get('/fact');
      _logger.d(response.data);
      final fact = CatFact(fact: response.data['fact']);
      SembastDB().setRandomFact(fact);
      return right(fact);
    } catch (e) {
      _logger.e(e);
      final fact = await SembastDB().getRandomFact();
      if (fact == null) {
        return left(const Failure.network());
      } else {
        return right(fact);
      }
    }
  }

  @override
  Future<Either<Failure, List<CatFact>>> getFacts(int page) async {
    try {
      final response = await _dio.get(
        '/facts',
        queryParameters: {
          'page': page,
          'limit': 20,
        },
      );
      _logger.d(response.data);
      final facts = response.data['data']
          .map<CatFact>((e) => CatFact(fact: e['fact']))
          .toList();
      SembastDB().setCatFacts(facts);
      return right(facts);
    } catch (e) {
      _logger.e(e);
      final facts = await SembastDB().getCatFacts();
      if (facts == null) {
        return left(const Failure.network());
      } else {
        return right(facts);
      }
    }
  }
}
