import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/pages/video_detail_page.dart';

class ItemVideoWidget extends StatelessWidget {
  //tiene que recibir un VideoModel para eso creamos videoModel y su constructor
  VideoModel videoModel;

  ItemVideoWidget({
    required this.videoModel,
  });

  @override
  Widget build(BuildContext context) {
    //Gestionamos la altura
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      //El container rodeamos de un gesture detected para que nos redireccione a otra pagina
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoDetailPage(// enviar un String el videoID
              videoID: videoModel.id.videoId,
            ),
          ),
        );
      },
      child: Container(
        //Rodeamos con un contaiber para gestionar el margen de los videos
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            //gestionamos la imagen en Stack para insertar el tiempo
            Stack(
              children: [
                Image.network(
                  videoModel.snippet.thumbnails.high
                      .url, // Hemos ingresado al objeto, snippet, thumbnails,high y la url
                  width: double.infinity,
                  height: height * 0.3, //gestionamos la altura
                  fit: BoxFit.cover, // aqui acomodamos la imagen
                ),
                //Posicionamos el container
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    color: Colors.black.withOpacity(0.7),
                    child: Text(
                      "23:22",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.zero, // aqui se quita el paddyng
              leading: CircleAvatar(
                backgroundColor: Colors.white12,
                backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/3379937/pexels-photo-3379937.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                ),
              ),
              title: Text(
                videoModel.snippet
                    .title, //ingresamos al modelo, snippet y title. para eso se verifica en postman
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
              subtitle: Text(
                "${videoModel.snippet.channelTitle} ° 6.5 M de vistas ° hace 2 años",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13.0,
                ),
              ),

              trailing: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    //Rodeamos el icono con container y colunm para ordenar el icono
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
