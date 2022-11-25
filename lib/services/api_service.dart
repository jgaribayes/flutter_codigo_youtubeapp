import 'dart:convert';

import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<List<VideoModel>> getVideos() async { //especificamos que es un future de tipo lista de videoModel
    //definimmos una lista de tipo video model
    List<VideoModel> videosModel = [];
    String _path =
        "$pathProduction/search?part=snippet&key=$apiKey&maxResults=30&regionCode=PE";
    Uri _uri = Uri.parse(_path);

    //Aqui hacemos la peticion, el metodo get es un future
    http.Response response = await http.get(_uri);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      //Si se cumple significa que todo esta bien
      //Covertimos todo a un mapa con nombre myMap de tipo String dinamico
      Map<String, dynamic> myMap = json.decode(response.body); //vamos a converti utilizando json toda la informacion que viene en response.body
      //Generamos una lista donde estaran los video
      List videos = myMap["items"];
      //print(videos);

      videosModel = videos.map((e) => VideoModel.fromJson(e)).toList(); //convertimos a un listado de VideModel
      //imprime la instancia con la cantidad de videos
      //print(videosModel);
      //Cuando tengamos la informacion vamos a retornar la lista de videosModel
      return videosModel;
    }
    //si no se cumple o exite algun problema con el servidor retornamos   videosModel con lista vacia
    return videosModel;

  }
}
