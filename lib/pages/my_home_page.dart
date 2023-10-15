import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:meulucky/pages/pagina_inicial.dart';
import 'package:meulucky/pages/pesagem/pesagem_page.dart';
import 'package:meulucky/pages/vacinas/vacinas_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: TabBarView(controller: tabController, children: const [
          PaginaInicial(),
          PesagemPage(),
          VacinasPage(),
        ]),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Color.fromARGB(212, 19, 206, 59),
          style: TabStyle.titled,
          items: const [
            TabItem(
                icon: Center(child: FaIcon(FontAwesomeIcons.paw)),
                title: "Home"),
            TabItem(
                icon: Center(child: FaIcon(FontAwesomeIcons.weight)),
                title: "Pesagem"),
            TabItem(
                icon: Center(child: FaIcon(FontAwesomeIcons.syringe)),
                title: "Vacinas"),
          ],
          initialActiveIndex: 1,
          onTap: (int i) {
            setState(() {});
            tabController.index = i;
          },
          controller: tabController,
        ),
      ),
    );
  }
}
