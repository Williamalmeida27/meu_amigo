import 'package:mobx/mobx.dart';

part 'meu_amigo_model.g.dart';

class MeuAmigo = _MeuAmigo with _$MeuAmigo;

abstract class _MeuAmigo with Store {
  @observable
  String? objectId;

  @observable
  String? nomeDoAmigo;

  @observable
  String? dataNascimento;

  @observable
  String? raca;

  @observable
  String? sexo;

  @observable
  String? createdAt;

  @observable
  String? updatedAt;

  _MeuAmigo({
    this.objectId,
    this.nomeDoAmigo,
    this.dataNascimento,
    this.raca,
    this.sexo,
    this.createdAt,
    this.updatedAt,
  });

  @action
  _MeuAmigo.vazio();

  @action
  _MeuAmigo.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nomeDoAmigo = json['nomeDoAmigo'];
    dataNascimento = json['dataNascimento'];
    raca = json['raca'];
    sexo = json['sexo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  @action
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['nomeDoAmigo'] = nomeDoAmigo;
    data['dataNascimento'] = dataNascimento;
    data['raca'] = raca;
    data['sexo'] = sexo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }
}
