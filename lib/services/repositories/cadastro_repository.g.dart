// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastroRepository on _CadastroRepository, Store {
  late final _$dadosAtom =
      Atom(name: '_CadastroRepository.dados', context: context);

  @override
  ObservableList<MeuAmigo> get dados {
    _$dadosAtom.reportRead();
    return super.dados;
  }

  @override
  set dados(ObservableList<MeuAmigo> value) {
    _$dadosAtom.reportWrite(value, super.dados, () {
      super.dados = value;
    });
  }

  late final _$dadosFutureAtom =
      Atom(name: '_CadastroRepository.dadosFuture', context: context);

  @override
  ObservableFuture<DadosMeuAmigo> get dadosFuture {
    _$dadosFutureAtom.reportRead();
    return super.dadosFuture;
  }

  @override
  set dadosFuture(ObservableFuture<DadosMeuAmigo> value) {
    _$dadosFutureAtom.reportWrite(value, super.dadosFuture, () {
      super.dadosFuture = value;
    });
  }

  late final _$salvarDadosAsyncAction =
      AsyncAction('_CadastroRepository.salvarDados', context: context);

  @override
  Future<void> salvarDados(MeuAmigo cadastro) {
    return _$salvarDadosAsyncAction.run(() => super.salvarDados(cadastro));
  }

  late final _$obterDadosAsyncAction =
      AsyncAction('_CadastroRepository.obterDados', context: context);

  @override
  Future<DadosMeuAmigo> obterDados() {
    return _$obterDadosAsyncAction.run(() => super.obterDados());
  }

  late final _$removerDadosAsyncAction =
      AsyncAction('_CadastroRepository.removerDados', context: context);

  @override
  Future<void> removerDados(String objectId) {
    return _$removerDadosAsyncAction.run(() => super.removerDados(objectId));
  }

  @override
  String toString() {
    return '''
dados: ${dados},
dadosFuture: ${dadosFuture}
    ''';
  }
}
