import 'package:meulucky/models/vacinacao/vacinacao_model.dart';
import 'package:meulucky/models/vacinacao/vacinas_model.dart';
import 'package:meulucky/services/repositories/dio/custom_dio.dart';

class VacinacaoRepository {
  var _customDio = CustomDio();

  Future<VacinacaoModel> obterVacinacao() async {
    try {
      var results = await _customDio.dio.get("/Vacinacao");
      return VacinacaoModel.fromJson(results.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> salvarVacina(VacinaModel vacinaModel) async {
    try {
      await _customDio.dio.post("/Vacinacao", data: vacinaModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<Veterinario> retornarVeterinario() async {
    try {
      var results = await _customDio.dio.get("/veteinario");
      return Veterinario.fromJson(results.data);
    } catch (e) {
      rethrow;
    }
  }
}
