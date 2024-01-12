part of 'facts_cubit.dart';

@freezed
class FactsState with _$FactsState {
  const factory FactsState.loading() = _Loading;
  const factory FactsState.failure() = _Failure;
  const factory FactsState.success({
    @Default(null) CatFact? randomFact,
    @Default(null) List<CatFact>? catFacts,
    @Default(1) int page,
    @Default(false) isScrolling,
  }) = _Success;
}
