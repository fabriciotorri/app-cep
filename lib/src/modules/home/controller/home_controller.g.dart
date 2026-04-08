// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$latAtom =
      Atom(name: '_HomeControllerBase.lat', context: context);

  @override
  double? get lat {
    _$latAtom.reportRead();
    return super.lat;
  }

  @override
  set lat(double? value) {
    _$latAtom.reportWrite(value, super.lat, () {
      super.lat = value;
    });
  }

  late final _$lonAtom =
      Atom(name: '_HomeControllerBase.lon', context: context);

  @override
  double? get lon {
    _$lonAtom.reportRead();
    return super.lon;
  }

  @override
  set lon(double? value) {
    _$lonAtom.reportWrite(value, super.lon, () {
      super.lon = value;
    });
  }

  late final _$cepAtom =
      Atom(name: '_HomeControllerBase.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$resultadoAtom =
      Atom(name: '_HomeControllerBase.resultado', context: context);

  @override
  String get resultado {
    _$resultadoAtom.reportRead();
    return super.resultado;
  }

  @override
  set resultado(String value) {
    _$resultadoAtom.reportWrite(value, super.resultado, () {
      super.resultado = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_HomeControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$erroAtom =
      Atom(name: '_HomeControllerBase.erro', context: context);

  @override
  String get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(String value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  late final _$buscarCepAsyncAction =
      AsyncAction('_HomeControllerBase.buscarCep', context: context);

  @override
  Future<void> buscarCep() {
    return _$buscarCepAsyncAction.run(() => super.buscarCep());
  }

  @override
  String toString() {
    return '''
lat: ${lat},
lon: ${lon},
cep: ${cep},
resultado: ${resultado},
loading: ${loading},
erro: ${erro}
    ''';
  }
}
