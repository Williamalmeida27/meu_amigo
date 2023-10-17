import 'package:meulucky/models/dados_meu_amigo_model.dart';
import 'package:meulucky/models/meu_amigo_model.dart';
import 'package:meulucky/services/repositories/dio/custom_dio.dart';
import 'package:mobx/mobx.dart';

part 'cadastro_repository.g.dart';

class CadastroRepository = _CadastroRepository with _$CadastroRepository;

abstract class _CadastroRepository with Store {
  @observable
  ObservableList<MeuAmigo> dados = ObservableList<MeuAmigo>();

  @observable
  ObservableFuture<DadosMeuAmigo> dadosFuture =
      ObservableFuture.value(DadosMeuAmigo());

  final _customDio = CustomDio();

  _CadastroRepository();

  @action
  Future<void> salvarDados(MeuAmigo cadastro) async {
    try {
      await _customDio.dio.post("/dadosPrincipais", data: cadastro.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<DadosMeuAmigo> obterDados() async {
    dadosFuture = ObservableFuture(
      _customDio.dio.get("/dadosPrincipais").then((response) {
        return DadosMeuAmigo.fromJson(response.data);
      }),
    );
    return dadosFuture;
  }

  @action
  Future<void> removerDados(String objectId) async {
    await _customDio.dio.delete("/dadosPrincipais/$objectId");
  }
}
