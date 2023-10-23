import 'meu_amigo_model.dart';

class DadosMeuAmigo {
  List<MeuAmigo> dadosCao = <MeuAmigo>[];

  DadosMeuAmigo({List<MeuAmigo>? dadosCao});

  DadosMeuAmigo.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      dadosCao = <MeuAmigo>[];
      json['results'].forEach((v) {
        dadosCao.add(MeuAmigo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dadosCao != null) {
      data['results'] = dadosCao!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
