class VacinaModel {
  String? data;

  String? vacina;

  Veterinario? veterinario;

  String? retorno;

  VacinaModel({this.data, this.vacina, this.veterinario, this.retorno});

  VacinaModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    vacina = json['vacina'];
    veterinario = json['veterinario'] != null
        ? new Veterinario.fromJson(json['veterinario'])
        : null;
    retorno = json['retorno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['vacina'] = this.vacina;
    if (this.veterinario != null) {
      data['veterinario'] = this.veterinario!.toJson();
    }
    data['retorno'] = this.retorno;
    return data;
  }
}

class Veterinario {
  String? nome;
  String? crmv;
  String? mapa;

  Veterinario({this.nome, this.crmv, this.mapa});

  Veterinario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    crmv = json['crmv'];
    mapa = json['mapa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['crmv'] = this.crmv;
    data['mapa'] = this.mapa;
    return data;
  }
}
