import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:meulucky/pages/main/material/my_app.dart';
import 'package:meulucky/services/repositories/cadastro_repository.dart';
import 'package:meulucky/services/repositories/hoje_repository.dart';
import 'package:meulucky/services/repositories/vacinacao_repository.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  getIt.registerSingleton<CadastroRepository>(CadastroRepository());
  getIt.registerSingleton<HojeRepository>(HojeRepository());
  getIt.registerSingleton<VacinacaoRepository>(VacinacaoRepository());

  runApp(const MyApp());
}
