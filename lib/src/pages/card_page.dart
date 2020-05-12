import 'package:flutter/material.dart';
class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30),
          _cardTipo2(), 
           SizedBox(height: 30),
            _cardTipo1(),
          SizedBox(height: 30),
          _cardTipo2(), 
           SizedBox(height: 30),
            _cardTipo1(),
          SizedBox(height: 30),
          _cardTipo2(), 
           SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Titulo'),
            subtitle: Text('Aqui estamos con la descripcion de la tarjeta android '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: (){},
              ),
               FlatButton(
              child: Text('Ok'),
              onPressed: (){},
              )
          ],)
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
     // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
           image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/2/2c/NZ_Landscape_from_the_van.jpg'
           ),
           fadeInDuration: Duration(milliseconds: 200),
           height: 300.0,
           fit: BoxFit.cover,
           ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Yo si se que poner')
              )
        ],
      ),
    );
    return Container(
      child: ClipRRect(
         borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
      decoration: BoxDecoration(
              color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,10.0)
          )
        ],
      ),
      );
  }
}