import 'package:meulucky/models/vacinacao/vacinas_model.dart';

class VacinacaoModel {
  List<VacinaModel> vacinasList = <VacinaModel>[];

  VacinacaoModel();

  VacinacaoModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      vacinasList = <VacinaModel>[];
      json['results'].forEach((v) {
        vacinasList.add(VacinaModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vacinasList != null) {
      data['results'] = vacinasList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
