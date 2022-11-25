import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';

class ItemFilterWidget extends StatelessWidget {
  //Estos atributos reciben el valor enviado por homePage

  String
      text; //La clase ItemFilterWidget necesita recibir un texto para eso creamos un atributo y su constructor
  bool isSelect; //Este atributo nos ayudara a sobrear el boton seleccionado

  ItemFilterWidget({
    required this.text,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //Chip ponemos dentro de containers para agregar un margin
      margin: const EdgeInsets.only(right: 10.0),
      //Clip permite poner los botones para escoger;
      child: Chip(
        //Si isSelect es verdadero el color de fondo es blanco, caso contrario  es el SecondaryColor
        backgroundColor: isSelect ? Colors.white : kBrandSecondaryColor,
        labelStyle: TextStyle(
          color: isSelect ? kBrandPrimaryColor : Colors.white,
        ),
        //jalamos el valor de el texto
        label: Text(text),
      ),
    );
  }
}
