import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Componentes"),
        ),
        body: _lista(),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarDatos(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );

    // return ListView(children: _listaItems());
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
          title: Text(element['texto']),
          leading: getIcon(element['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            // Navegacion

            Navigator.pushNamed(context, element['ruta']);

            // final route = MaterialPageRoute(
            //   builder: (context) => AlertPage()
            // );

            // Navigator.push(context, route);
          });

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
