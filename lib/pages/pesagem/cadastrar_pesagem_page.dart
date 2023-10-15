import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meulucky/models/pesagem_model.dart';

import 'package:meulucky/repositories/pesagem_repository.dart';

class CadastrarPesagemPage extends StatefulWidget {
  const CadastrarPesagemPage({super.key});

  @override
  State<CadastrarPesagemPage> createState() => _CadastrarPesagemPageState();
}

class _CadastrarPesagemPageState extends State<CadastrarPesagemPage> {
  TextEditingController dataController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController vermifugoController = TextEditingController();
  late PesagemRepository _pesagemRepository;
  var dados = Pesagem();
  bool salvando = false;

  @override
  void initState() {
    // TODO: implement initState
    carregarDados();
    super.initState();
  }

  carregarDados() async {
    _pesagemRepository = PesagemRepository();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cadastrar Pesagem"),
        ),
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("Data:")),
              keyboardType: TextInputType.datetime,
              controller: dataController,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                DataInputFormatter(),
              ],
              onChanged: (value) {
                dataController.text = value;
                dados.data = dataController.text;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Peso:")),
              keyboardType: TextInputType.number,
              controller: pesoController,
              onChanged: (value) {
                pesoController.text = value;
                dados.peso = double.parse(pesoController.text);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Vermifugo:")),
              controller: vermifugoController,
              onChanged: (value) {
                vermifugoController.text = value;
                dados.vermifugo = vermifugoController.text;
              },
            ),
            TextButton(
                onPressed: () async {
                  await _pesagemRepository.salvarDadosPesagem(dados);
                  setState(() {
                    salvando = true;
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Salvando...")));
                  });
                  Future.delayed(const Duration(seconds: 4), () {
                    setState(() {
                      salvando = false;
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Dados salvo com sucesso!")));
                    }); // Prints after 1 second.
                  });
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
