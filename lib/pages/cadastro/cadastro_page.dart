import 'package:flutter/material.dart';
import 'package:meulucky/models/meu_amigo_model.dart';
import 'package:meulucky/repositories/cadastro_repository.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  late CadastroRepository _cadastroRepository;
  var meuAmigo = MeuAmigo.vazio();
  TextEditingController nomeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController racaController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  bool salvando = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    carregarDados();
  }

  carregarDados() async {
    _cadastroRepository = CadastroRepository();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dados Cadastrais"),
          backgroundColor: Colors.blue,
        ),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text("Nome:"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: nomeController,
                  onChanged: (value) {
                    nomeController.text = value;
                    meuAmigo.nomeDoAmigo = nomeController.text;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text("Data de Nascimento:"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  readOnly: true,
                  controller: dataNascimentoController,
                  onTap: () async {
                    var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1930, 1, 1),
                        lastDate: DateTime(2119, 10, 10));
                    if (data != null) {
                      dataNascimentoController.text = data.toString();
                      meuAmigo.dataNascimento = data.toIso8601String();

                      setState(() {});
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text("Raça:"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: racaController,
                  onChanged: (value) {
                    racaController.text = value;
                    meuAmigo.raca = racaController.text;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text("Sexo:"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: sexoController,
                  onChanged: (value) {
                    sexoController.text = value;
                    meuAmigo.sexo = sexoController.text;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: TextButton(
                        onPressed: () async {
                          await _cadastroRepository.salvarDados(meuAmigo);
                          carregarDados();
                          Navigator.pop(context);
                          setState(() {
                            salvando = true;
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Salvando...")));
                          });
                          Future.delayed(const Duration(seconds: 4), () {
                            setState(() {
                              salvando = false;
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Dados salvo com sucesso!")));
                            }); // Prints after 1 second.
                          });
                        },
                        child: const Text("Salvar"))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: TextButton(
                        onPressed: () async {}, child: const Text("Obter"))),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
