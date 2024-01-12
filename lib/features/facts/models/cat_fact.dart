import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_fact.freezed.dart';

@freezed
class CatFact with _$CatFact {
  const factory CatFact({required String fact}) = _CatFact;
}
