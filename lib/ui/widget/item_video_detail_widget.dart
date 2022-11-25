import 'package:flutter/material.dart';

class ItemVideoDetailWidget extends StatelessWidget {
  //vamos a recibir 2 parametros
  String text;
  IconData icon;

  ItemVideoDetailWidget({
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 26.0),
      child: Column(//Rodeamos con containar para darle margin
        children: [
          Icon(
            icon,//Cargamos los datos del parametro
            color: Colors.white,
          ),
          Text(
            text,//Cargamos los datos del parametro
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
