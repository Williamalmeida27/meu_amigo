import 'package:mobx/mobx.dart';

import 'meu_amigo_model.dart';

part 'dados_meu_amigo_model.g.dart';

class DadosMeuAmigo = _DadosMeuAmigo with _$DadosMeuAmigo;

abstract class _DadosMeuAmigo with Store {
  ObservableList<MeuAmigo> _dadosCao = <MeuAmigo>[].asObservable();

  @computed
  List<MeuAmigo> get dadosCao => _dadosCao.toList();

  _DadosMeuAmigo({ObservableList<MeuAmigo>? dadosCao});

  @action
  _DadosMeuAmigo.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _dadosCao = <MeuAmigo>[].asObservable();
      json['results'].forEach((v) {
        _dadosCao!.add(MeuAmigo.fromJson(v));
      });
    }
  }

  @action
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_dadosCao != null) {
      data['results'] = _dadosCao!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
