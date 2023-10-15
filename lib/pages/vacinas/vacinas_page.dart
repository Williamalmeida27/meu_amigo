import 'package:flutter/material.dart';

class VacinasPage extends StatefulWidget {
  const VacinasPage({super.key});

  @override
  State<VacinasPage> createState() => _VacinasPageState();
}

class _VacinasPageState extends State<VacinasPage> {
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
              Expanded(child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
