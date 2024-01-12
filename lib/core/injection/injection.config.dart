// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:cats_challenge/core/injection/module.dart' as _i8;
import 'package:cats_challenge/features/facts/cubits/facts/facts_cubit.dart'
    as _i7;
import 'package:cats_challenge/features/facts/repository/facts_repository.dart'
    as _i6;
import 'package:cats_challenge/features/facts/repository/i_facts_repository.dart'
    as _i5;
import 'package:logger/logger.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final module = _$Module();
    gh.lazySingleton<_i3.Dio>(() => module.dio);
    gh.lazySingleton<_i4.Logger>(() => module.logger);
    gh.lazySingleton<_i5.IFactsRepository>(() => _i6.FactsRepository(
          gh<_i3.Dio>(),
          gh<_i4.Logger>(),
        ));
    gh.factory<_i7.FactsCubit>(
        () => _i7.FactsCubit(gh<_i5.IFactsRepository>()));
    return this;
  }
}

class _$Module extends _i8.Module {}
