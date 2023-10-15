import 'package:meulucky/models/dados_meu_amigo_model.dart';
import 'package:meulucky/models/meu_amigo_model.dart';
import 'package:meulucky/repositories/dio/custom_dio.dart';

class CadastroRepository {
  final _customDio = CustomDio();

  CadastroRepository();

  Future<void> salvarDados(MeuAmigo cadastro) async {
    try {
      await _customDio.dio.post("/dadosPrincipais", data: cadastro.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<DadosMeuAmigo> obterDados() async {
    var result = await _customDio.dio.get("/dadosPrincipais");
    return DadosMeuAmigo.fromJson(result.data);
  }

  Future<void> removerDados(String objectId) async {
    await _customDio.dio.delete("/dadosPrincipais/$objectId");
  }
}