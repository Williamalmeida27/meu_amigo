class MeuAmigo {
  String? objectId;
  String? nomeDoAmigo;
  String? dataNascimento;
  String? raca;
  String? sexo;
  String? createdAt;
  String? updatedAt;

  MeuAmigo({
    this.objectId,
    this.nomeDoAmigo,
    this.dataNascimento,
    this.raca,
    this.sexo,
    this.createdAt,
    this.updatedAt,
  });

  MeuAmigo.vazio();

  MeuAmigo.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nomeDoAmigo = json['nomeDoAmigo'];
    dataNascimento = json['dataNascimento'];
    raca = json['raca'];
    sexo = json['sexo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

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
