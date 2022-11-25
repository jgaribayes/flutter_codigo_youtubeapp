import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/services/api_service.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';
import 'package:flutter_codigo_youapp/ui/widget/item_filter_widget.dart';
import 'package:flutter_codigo_youapp/ui/widget/item_video_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //instanciamos un objeto de clase APIService
  final APIService _apiServices = APIService();
  //necesitamos traer la informacion a una lista de tipo VideoModel
  List<VideoModel> videos = [];

  @override
  initState() {
    super.initState();
    getData(); //con esto obtenemos la informacion que nosotros ncesitamos
  }

  //creamos un metodo getData que se va encargar de traer la informacion de nuestro servicio
  getData() {
    //llamamos al servicio
    _apiServices.getVideos().then((value) {
      // es un future por eso usamos .then
      videos = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _apiServices.getVideos();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        child: Column(
          children: [
            //Aqui se construye los menus Todos, Mixes...
            SingleChildScrollView(
              //El Rox Envolvemos con SingleChildScroll para evitar overflowed
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kBrandSecondaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                    ),
                    icon: const Icon(Icons.explore_outlined),
                    label: const Text("Exportar"),
                  ),
                  const SizedBox(
                    //para limitar el tamaño siempre se pone un Sizebox
                    height: 32.0,
                    child: VerticalDivider(
                      color: Colors.white30,
                      thickness: 1.0, //Tamaño de el divider
                    ),
                  ),
                  ItemFilterWidget(
                    //Enviamos parametros para la clase ItemFilterWidget
                    text: "Todos",
                    isSelect: true,
                  ),
                  ItemFilterWidget(
                    text: "Mixes",
                    isSelect: false,
                  ),
                  ItemFilterWidget(
                    text: "Musica",
                    isSelect: false,
                  ),
                  ItemFilterWidget(
                    text: "Programacion",
                    isSelect: false,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ListView.builder(
              //importante poner esto sino se rompe o genera conflicto con SingleChildScrull...
              shrinkWrap: true,
              physics: ScrollPhysics(), // ayuda a mover el scroll
              //tamaño de los elementos que tenemos que dibujar de acuerdo a la lista videos
              itemCount: videos.length,
              itemBuilder: (BuildContext contex, int index) {
                return ItemVideoWidget(
                  videoModel: videos[index], // enviamos el parametro a la clase ItemVideoWidget
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
