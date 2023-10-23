import 'package:meulucky/models/today_model.dart';
import 'package:meulucky/services/repositories/dio/custom_dio.dart';

class HojeRepository {
  var _customDio = CustomDio();

  Future<void> criarTarefa(Today hoje) async {
    try {
      await _customDio.dio.post('/hoje', data: hoje.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<Todays> obterTarefas() async {
    try {
      var result = await _customDio.dio.get('/hoje');
      return Todays.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> alterarTarefas(Today hoje) async {
    try {
      await _customDio.dio
          .put('/hoje/${hoje.objectId}', data: hoje.toJsonEndPoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> excluirTarefas(String id) async {
    try {
      await _customDio.dio.delete('/hoje/$id');
    } catch (e) {
      rethrow;
    }
  }
}
