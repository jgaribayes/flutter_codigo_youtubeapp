import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';

class ChannelPage extends StatefulWidget {
  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage>
    with SingleTickerProviderStateMixin {
  //un tabBar necesita de un controlador para eso creamos
  //luego lo inicializamos para eso usamos late
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //inicializamos el _tabController
    //Usaremos un mixin
    _tabController = TabController(length: 6, vsync: this); // 6 elementos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBrandPrimaryColor,
        elevation: 0,
        title: Text("Lorem ipsum"),
        actions: [
          // podemos agregar Iconos a nuestro appBar
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cast,
              color: Colors.white,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController, //Asignamos el cotrolador
          isScrollable: true, // para usar el scroll
          indicatorColor: Colors.white, // Se usa cuando se selecciona el tab
          indicatorWeight: 2.7,
          tabs: [
            Tab(
              child: Text(
                "PAGINA PRINCIPAL",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Tab(
              child: Text(
                "VIDEOS",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Tab(
              child: Text(
                "LISTA DE REPRODUCCION",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Tab(
              child: Text(
                "COMUNIDAD",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Tab(
              child: Text(
                "CANALES",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Tab(
              child: Text(
                "MASINFORMACION",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text("Pagina 1"),
          ),
          Center(
            child: Text("Pagina 2"),
          ),
          Center(
            child: Text("Pagina 3"),
          ),
          Center(
            child: Text("Pagina 4"),
          ),
          Center(
            child: Text("Pagina 5"),
          ),
          Center(
            child: Text("Pagina 6"),
          ),

        ],
      ),
    );
  }
}
