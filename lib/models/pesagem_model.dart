class Pesagens {
  List<Pesagem>? results;

  Pesagens({this.results});

  Pesagens.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Pesagem>[];
      json['results'].forEach((v) {
        results!.add(Pesagem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pesagem {
  String? data;
  double? peso;
  String? vermifugo;

  Pesagem({this.data, this.peso, this.vermifugo});

  Pesagem.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    peso = double.parse(json['peso'].toString());
    vermifugo = json['vermifugo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['peso'] = this.peso;
    data['vermifugo'] = this.vermifugo;
    return data;
  }
}
