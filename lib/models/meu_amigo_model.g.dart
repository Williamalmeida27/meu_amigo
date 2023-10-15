// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meu_amigo_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MeuAmigo on _MeuAmigo, Store {
  late final _$objectIdAtom =
      Atom(name: '_MeuAmigo.objectId', context: context);

  @override
  String? get objectId {
    _$objectIdAtom.reportRead();
    return super.objectId;
  }

  @override
  set objectId(String? value) {
    _$objectIdAtom.reportWrite(value, super.objectId, () {
      super.objectId = value;
    });
  }

  late final _$nomeDoAmigoAtom =
      Atom(name: '_MeuAmigo.nomeDoAmigo', context: context);

  @override
  String? get nomeDoAmigo {
    _$nomeDoAmigoAtom.reportRead();
    return super.nomeDoAmigo;
  }

  @override
  set nomeDoAmigo(String? value) {
    _$nomeDoAmigoAtom.reportWrite(value, super.nomeDoAmigo, () {
      super.nomeDoAmigo = value;
    });
  }

  late final _$dataNascimentoAtom =
      Atom(name: '_MeuAmigo.dataNascimento', context: context);

  @override
  String? get dataNascimento {
    _$dataNascimentoAtom.reportRead();
    return super.dataNascimento;
  }

  @override
  set dataNascimento(String? value) {
    _$dataNascimentoAtom.reportWrite(value, super.dataNascimento, () {
      super.dataNascimento = value;
    });
  }

  late final _$racaAtom = Atom(name: '_MeuAmigo.raca', context: context);

  @override
  String? get raca {
    _$racaAtom.reportRead();
    return super.raca;
  }

  @override
  set raca(String? value) {
    _$racaAtom.reportWrite(value, super.raca, () {
      super.raca = value;
    });
  }

  late final _$sexoAtom = Atom(name: '_MeuAmigo.sexo', context: context);

  @override
  String? get sexo {
    _$sexoAtom.reportRead();
    return super.sexo;
  }

  @override
  set sexo(String? value) {
    _$sexoAtom.reportWrite(value, super.sexo, () {
      super.sexo = value;
    });
  }

  late final _$createdAtAtom =
      Atom(name: '_MeuAmigo.createdAt', context: context);

  @override
  String? get createdAt {
    _$createdAtAtom.reportRead();
    return super.createdAt;
  }

  @override
  set createdAt(String? value) {
    _$createdAtAtom.reportWrite(value, super.createdAt, () {
      super.createdAt = value;
    });
  }

  late final _$updatedAtAtom =
      Atom(name: '_MeuAmigo.updatedAt', context: context);

  @override
  String? get updatedAt {
    _$updatedAtAtom.reportRead();
    return super.updatedAt;
  }

  @override
  set updatedAt(String? value) {
    _$updatedAtAtom.reportWrite(value, super.updatedAt, () {
      super.updatedAt = value;
    });
  }

  late final _$_MeuAmigoActionController =
      ActionController(name: '_MeuAmigo', context: context);

  @override
  Map<String, dynamic> toJson() {
    final _$actionInfo =
        _$_MeuAmigoActionController.startAction(name: '_MeuAmigo.toJson');
    try {
      return super.toJson();
    } finally {
      _$_MeuAmigoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
objectId: ${objectId},
nomeDoAmigo: ${nomeDoAmigo},
dataNascimento: ${dataNascimento},
raca: ${raca},
sexo: ${sexo},
createdAt: ${createdAt},
updatedAt: ${updatedAt}
    ''';
  }
}
