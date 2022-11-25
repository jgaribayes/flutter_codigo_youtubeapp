import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/pages/channel_page.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';
import 'package:flutter_codigo_youapp/ui/widget/item_video_detail_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailPage extends StatefulWidget {
  //Creamos la variable para capturar el videoID
  String videoID;

  VideoDetailPage({
    required this.videoID,
  });

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  //Creamos un controlador, usamos la palabra clave late que indica que esta instancia por ahora es null y lugo sera asignado con algun valor
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Inicializamos lo siguiente
    _playerController = YoutubePlayerController(
        initialVideoId: widget.videoID,
        //configuraciones en el video al iniciar, si va tener opcion de mute, forzar hd, ocultar la imagen referencial, que inicien en un punto...
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          hideControls: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.33,
            //rodeamos con YoutubePlayer para darle altura atraves de un mediaQuery
            child: YoutubePlayer(
              controller: _playerController, //Asignamos el controlador
              progressColors: ProgressBarColors(
                playedColor: Colors
                    .red, // para modificar la linea de avance de color rojo
                handleColor: Colors
                    .red, // para modifcar el indicador de avance de color rojo
                bufferedColor: Colors.white54,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Lorem ipsum dolor sir amet",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                height: 1.3, //separion de lineas
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            subtitle: Text(
              "° 6.5 M de vistas ° hace 2 años",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 13.0,
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: SingleChildScrollView(//Aqui ponemos un movimiento vertical
            child: Column(
              children: [
                SingleChildScrollView(
                  //rodeamos para el scroll y ponemos el sentido orizontal
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    //rodeamos para gestionar el relleno
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ItemVideoDetailWidget(
                          text: "53 K",
                          icon: Icons.thumb_up_alt_outlined,
                        ), // enviamos los parametros al widget
                        ItemVideoDetailWidget(
                          text: "No me gusta",
                          icon: Icons.thumb_down_alt_outlined,
                        ), // enviamos los parametros al widget
                        ItemVideoDetailWidget(
                          text: "Compartir",
                          icon: Icons.share,
                        ), // enviamos los parametros al widget
                        ItemVideoDetailWidget(
                          text: "Crear",
                          icon: Icons.play_arrow_rounded,
                        ), // enviamos los parametros al widget
                        ItemVideoDetailWidget(
                          text: "Descargar",
                          icon: Icons.download_rounded,
                        ), // enviamos los parametros al widget
                        ItemVideoDetailWidget(
                          text: "Descargar",
                          icon: Icons.download_rounded,
                        ), // enviamos los parametros al widget
                        ItemVideoDetailWidget(
                          text: "Descargar",
                          icon: Icons.download_rounded,
                        ), // enviamos los parametros al widget
                        ItemVideoDetailWidget(
                          text: "Descargar",
                          icon: Icons.download_rounded,
                        ), // enviamos los parametros al widget
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white24,
                ),
                ListTile(//Aqui nos redirecciona a la pagina del canal
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChannelPage(),),);
                  },
                  leading: CircleAvatar(
                    //Sirve para poner un widget en el inicio del LisTile
                    backgroundColor: Colors.white12,
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/3379937/pexels-photo-3379937.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                  ),
                  title: Text(
                    "Loren ipsum dolor sit amet",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  subtitle: Text(
                    "1.43 M de suscriptores",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize
                        .min, // El ancho maximo se tiene que adaptar a los hijos
                    children: [
                      Text(
                        "SUSCRITO",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white12,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white24,
                ),
                Container(
                  height: 200,
                  color: Colors.indigo,
                ),
                Container(
                  height: 200,
                  color: Colors.yellow,
                ),
                Container(
                  height: 200,
                  color: Colors.red,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
