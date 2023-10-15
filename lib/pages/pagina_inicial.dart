import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unused_import
import 'package:meulucky/models/dados_meu_amigo_model.dart';
import 'package:meulucky/models/today_model.dart';
import 'package:meulucky/pages/cadastro/cadastro_page.dart';
import 'package:meulucky/repositories/cadastro_repository.dart';
import 'package:meulucky/repositories/hoje_repository.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  TextEditingController descricaoController = TextEditingController();
  late CadastroRepository cadastroRepository;
  late HojeRepository _hojeRepository;
  var _dadosMeuAmigo = DadosMeuAmigo();
  var _hoje = Todays();
  bool loading = false;
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    _hojeRepository = HojeRepository();
    _hoje = await _hojeRepository.obterTarefas();
    cadastroRepository = CadastroRepository();
    _dadosMeuAmigo = await cadastroRepository.obterDados();

    if (!mounted) return;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading == true
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _dadosMeuAmigo._dadosCao?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var dado = _dadosMeuAmigo._dadosCao?[index];
                      return Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: InkWell(
                              child: Card(
                                color: const Color.fromARGB(211, 52, 166, 76),
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 180,
                                        width: 180,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://assets.petco.com/petco/image/upload/f_auto,q_auto/category-dog-img-3-030922-300x300"),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Text(
                                        dado?.nomeDoAmigo ?? "",
                                        style: const TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext bc) =>
                                            const CadastroPage()));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text("Data nascimento:"),
                                    Text(dado?.dataNascimento ?? "")
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Raça:"),
                                    Text(dado?.raca ?? ""),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Sexo:"),
                                    Text(dado?.sexo ?? ""),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hoje:",
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Tarefa:"),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                ),
                                const Text("Feito?")
                              ],
                            )
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: _hoje.results?.length,
                              itemBuilder: (BuildContext, index) {
                                var hoje = _hoje.results?[index];
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(hoje?.descricao ?? ""),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                    ),
                                    Switch(
                                        value: hoje?.concluido ?? false,
                                        onChanged: (value) async {
                                          hoje?.concluido = value;
                                          if (hoje != null) {
                                            await _hojeRepository
                                                .alterarTarefas(hoje);
                                          }
                                          carregarDados();
                                        })
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
      floatingActionButton: loading
          ? const CircularProgressIndicator()
          : FloatingActionButton.small(
              child: const FaIcon(FontAwesomeIcons.dog),
              onPressed: () async {
                descricaoController.text = "";
                showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        child: AlertDialog(
                          title: const Text("Adicionar Tarefa do dia:"),
                          content: TextField(
                            controller: descricaoController,
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancelar")),
                            TextButton(
                                onPressed: () async {
                                  await HojeRepository().criarTarefa(
                                      Today.criar(
                                          descricaoController.text, false));
                                  carregarDados();
                                  Navigator.pop(context);
                                },
                                child: const Text("Salvar"))
                          ],
                        ),
                      );
                    });
              }),
    );
  }
}
