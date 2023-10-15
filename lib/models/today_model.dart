class Todays {
  List<Today>? results;

  Todays({this.results});

  Todays.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Today>[];
      json['results'].forEach((v) {
        results!.add(Today.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Today {
  String? objectId;
  String? descricao;
  bool? concluido;
  String? createdAt;
  String? updatedAt;

  Today(
      {this.objectId,
      this.descricao,
      this.concluido,
      this.createdAt,
      this.updatedAt});

  Today.criar(this.descricao, this.concluido);

  Today.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    descricao = json['descricao'];
    concluido = json['concluido'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['objectId'] = objectId;
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonEndPoint() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['descricao'] = descricao;
    data['concluido'] = concluido;
    return data;
  }
}
