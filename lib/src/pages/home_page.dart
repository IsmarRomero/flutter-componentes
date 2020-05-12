
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
        ),
        body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<dynamic>> snapshop) {
        return ListView(children: _crearListaItem(snapshop.data, context),);
      },
    future: menuProvider.cargarData(),
    initialData: [],);
    // return ListView(children: _crearListaItem(),);
  }

  List<Widget> _crearListaItem(List<dynamic> data, BuildContext context) {
    final List<Widget> list = [];
    data.forEach((opt){
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){
          Navigator.pushNamed(context, opt['ruta']);
          // final route = MaterialPageRoute(
          //   builder: (context)  => AlertPage()
          //   );
          // Navigator.push(context, route);
        },
      );
      list..add(widgetTemp)
          ..add(Divider());
    });
    // print(menuProvider.opciones);
    return list;
  }
}