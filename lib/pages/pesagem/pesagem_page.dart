import 'package:flutter/material.dart';
import 'package:meulucky/models/pesagem_model.dart';
import 'package:meulucky/pages/shared/custom_drawer.dart';
import 'package:meulucky/repositories/pesagem_repository.dart';

class PesagemPage extends StatefulWidget {
  const PesagemPage({super.key});

  @override
  State<PesagemPage> createState() => _PesagemPageState();
}

class _PesagemPageState extends State<PesagemPage> {
  late PesagemRepository _pesagemRepository;
  var listPesagem = Pesagens();
  var cancelando;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    _pesagemRepository = PesagemRepository();

    listPesagem = await _pesagemRepository.obterpesagem();
    if (!mounted) return;

    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            title: const Text("Pesagens"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
            child: Column(
              children: [
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("PESO"),
                        Text("DATA"),
                        Text("VERMIFUGO"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: listPesagem.results?.length,
                      itemBuilder: (BuildContext bc, index) {
                        var pesos = listPesagem.results?[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(pesos?.peso.toString() ?? ""),
                            Text(pesos?.data.toString() ?? ""),
                            Text(pesos?.vermifugo ?? "")
                          ],
                        );
                      }),
                )
              ],
            ),
          )),
    );
  }
}
