import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meulucky/pages/my_home_page.dart';
import 'package:meulucky/pages/pesagem/cadastrar_pesagem_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 8,
        width: MediaQuery.sizeOf(context).width * 0.55,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const CadastrarPesagemPage()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      "Cadastrar Pesagem",
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FaIcon(FontAwesomeIcons.add)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MyHomePage()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Row(
                  children: [FaIcon(FontAwesomeIcons.arrowLeftLong)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
