// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:meulucky/models/pesagem_model.dart';
import 'package:meulucky/repositories/dio/custom_dio.dart';

class PesagemRepository {
  var _customDio = CustomDio();

  PesagemRepository();

  Future<void> salvarDadosPesagem(Pesagem pesagem) async {
    try {
      await _customDio.dio.post("/pesagem", data: pesagem.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<Pesagens> obterpesagem() async {
    var results = await _customDio.dio.get("/pesagem");
    return Pesagens.fromJson(results.data);
  }
}
