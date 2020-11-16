import 'dart:io';
import 'package:camara/Models/Foto.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:async';
import 'dart:convert';

class Foto {
  Foto();

  Future<List> getFotos() async {
    List<Foto_m> listamos = List();
    try {
      http.Response respon = await http.get('');
      var jsonS = respon.body;
      var list = json.decode(jsonS);
      for (var i = 0; i < list.length; i++) {
        var temfoto = Foto_m.fromJson(list[i]);
        var ruta = temfoto.getRuta();
        temfoto.setRuta('' + ruta);
        listamos.add(temfoto);
      }
      return listamos;
    } catch (Exception) {
      return listamos;
    }
  }

  Future<int> add(File file, String nombre, String descripcion) async {
    var postUri = Uri.parse("");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['descripcion'] = descripcion;
    request.fields['nombre'] = nombre;
    request.files.add(await http.MultipartFile.fromPath('image', file.path,
        contentType: MediaType('image', 'jpeg')));

    var response = await request.send();
    if (response.statusCode == 200) return 200;
    return 6;
  }

  Future<String> delete(int id) async {
    String respuesta = "";
    try {
      http.Response respon =
          await http.delete('');
      var jsonS = respon.body;
      respuesta = json.decode(jsonS);
      return respuesta;
    } catch (Exception) {
      return respuesta;
    }
  }
}
