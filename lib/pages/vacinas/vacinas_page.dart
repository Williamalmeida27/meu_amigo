import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meulucky/main.dart';
import 'package:meulucky/models/vacinacao/vacinacao_model.dart';
import 'package:meulucky/models/vacinacao/vacinas_model.dart';
import 'package:meulucky/services/repositories/vacinacao_repository.dart';

class VacinasPage extends StatefulWidget {
  @override
  State<VacinasPage> createState() => _VacinasPageState();
}

class _VacinasPageState extends State<VacinasPage> {
  TextEditingController vacinaController = TextEditingController();
  var vacinacao = getIt<VacinacaoRepository>();
  var listVeterinario = getIt<VacinacaoRepository>();
  var vacinas = VacinacaoModel();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    vacinas = await vacinacao.obterVacinacao();
    await listVeterinario.obterVacinacao();
  }

  List<DropdownMenuItem<Veterinario>> returnItemDropDown() {
    var itens = <DropdownMenuItem<Veterinario>>[];

    // for (var element in listVeterinario.veterinario) {
    //   itens.add(DropdownMenuItem(
    //     value: element,
    //     child: Text(element.nome.toString()),
    //   ));
    // }

    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Vacinas"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("DATA"),
                        Text("VACINA"),
                        Text("MÉDICO VETERINARIO"),
                        Text("RETORNO"),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: vacinas.vacinasList.length,
                          itemBuilder: (_, index) {
                            var vacina = vacinas.vacinasList[index];
                            return Row(
                              children: [Text(vacina.data ?? "teste")],
                            );
                          }))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.small(
                child: const FaIcon(FontAwesomeIcons.plusMinus),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext bc) {
                        return AlertDialog(
                          title: const Text("Vacinação:"),
                          content: Column(
                            children: [
                              TextField(
                                decoration:
                                    const InputDecoration(label: Text("Data")),
                                controller: vacinaController,
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                    label: Text("Vacina")),
                                controller: vacinaController,
                              ),
                              const Text("Veterinário"),
                              DropdownButton(
                                  isExpanded: true,
                                  value: 10,
                                  items: returnItemDropDown(),
                                  onChanged: (value) {
                                    setState(() {});
                                  }),
                              TextField(
                                decoration: const InputDecoration(
                                    label: Text("Retorno")),
                                controller: vacinaController,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancelar")),
                            TextButton(
                                onPressed: () async {},
                                child: const Text("Salvar"))
                          ],
                        );
                      });
                })));
  }
}
