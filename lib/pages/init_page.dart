import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/pages/home_page.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0; // que servira para cambiar la selleccion

  //Esto lista nos permite cambiar de body
  List<Widget> _pages = [
    HomePage(),
    Center(child: Text("Shorts")),
    Center(child: Text("Agregar")),
    Center(child: Text("Suscripcion")),
    Center(child: Text("Biblioteca")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBrandPrimaryColor,
        title: Image.asset(
          'assets/images/logo.png',
          height: 26.0,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cast,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Stack(
                clipBehavior: Clip.none, // para que no corte el circulo rojo
                children: [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  Positioned(
                    top: -2,
                    right: -4,
                    child: Container(
                      padding: EdgeInsets.all(2.4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Text(
                        "9+",
                        style: TextStyle(
                          fontSize: 11.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 6.0,
          ),
          const CircleAvatar(
            backgroundColor: Colors.white12,
            radius: 14.0,
            backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
        ],
      ),
      body: _pages[_currentIndex], // Permite cambiar body en la lista
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrandPrimaryColor,
        selectedItemColor: Colors.white, // cambia color al seleccionar elemento
        //Cambia color cuando no esta seleccionado
        unselectedItemColor: Colors.white60,
        //el tamaño del texto cuando este seleccionado
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed, //Para Agregar mas Iconos
        currentIndex: _currentIndex, // para seleccionar el elemento o item
        onTap: (int value) {
          //valor del item - asignamos el valor seleccionadao
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: "Principal",
            icon: Icon(
              Icons.home_filled,
            ),
          ),
          BottomNavigationBarItem(
            label: "Shorts",
            icon: Icon(
              Icons.play_arrow_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: const Icon(
                Icons.add_circle_outline,
                size: 30.0,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Suscripciones",
            icon: Icon(
              Icons.subscriptions_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(
              Icons.video_call_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
