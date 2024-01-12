import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:cats_challenge/features/facts/models/cat_fact.dart';
import 'package:cats_challenge/features/facts/repository/i_facts_repository.dart';

part 'facts_state.dart';
part 'facts_cubit.freezed.dart';

@injectable
class FactsCubit extends Cubit<FactsState> {
  FactsCubit(this._repository) : super(FactsState.loading());
  final IFactsRepository _repository;

  Timer? randomFactTimer;
  Timer? factsTimer;
  List<CatFact>? factsTemp;

  void initializeFacts({bool isRetry = false}) {
    if (isRetry) {
      randomFactTimer?.cancel();
      factsTimer?.cancel();
      emit(FactsState.loading());
    }
    state.maybeMap(
      orElse: () => null,
      loading: (_) async {
        final result1 = await _repository.getFacts(1);
        final catFacts = result1.fold((l) => null, (r) => r);
        final result2 = await _repository.getRandomFact();
        final randomFact = result2.fold((l) => null, (r) => r);
        if (catFacts == null && randomFact == null) {
          emit(FactsState.failure());
          return;
        } else {
          emit(FactsState.success(catFacts: catFacts, randomFact: randomFact));
          getFacts();
          getRandomFact();
        }
      },
    );
  }

  void getFacts() async {
    factsTimer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        state.maybeMap(
          orElse: () => null,
          success: (s) async {
            final result = await _repository.getFacts(s.page + 1);
            result.fold((l) {
              timer.cancel();
            }, (r) {
              if (r.isEmpty) {
                emit(s.copyWith(page: 1));
              } else {
                if (s.isScrolling) {
                  factsTemp = r;
                } else {
                  emit(s.copyWith(catFacts: r, page: s.page + 1));
                }
              }
            });
          },
        );
      },
    );
  }

  void getRandomFact() async {
    randomFactTimer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        state.maybeMap(
          orElse: () => null,
          success: (s) async {
            final result = await _repository.getRandomFact();
            result.fold((l) {
              timer.cancel();
            }, (r) => emit(s.copyWith(randomFact: r)));
          },
        );
      },
    );
  }

  void scrollStatusChanged(bool isScrolling) {
    state.maybeMap(
      orElse: () => null,
      success: (s) {
        if (!isScrolling && (factsTemp?.isNotEmpty ?? false)) {
          Future.delayed(const Duration(seconds: 1));
          emit(s.copyWith(isScrolling: false, catFacts: factsTemp));
        } else {
          emit(s.copyWith(isScrolling: false));
        }
      },
    );
  }
}
