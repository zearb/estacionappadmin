import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:estacionapp/models/empresa_model.dart';
import 'package:estacionapp/preferencias_usuario/preferencias_usuario.dart';

class EmpresaProvider{

  final String _url = 'https://estacionapp-3e428.firebaseio.com';
  
  final _prefs = new PreferenciasUsuario();



  Future<List<EmpresaModel>> cargarEmpresa() async{

    final url = '$_url/empresa.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<EmpresaModel> datosEmpresa = new List();

    // print(decodedData);

    if(decodedData == null) return [];

    decodedData.forEach((id,empresa){

      // print(id);
      // print(empresa['admin']);

      if(empresa['admin'] == _prefs.em){

        // print(empresa);
        final empresaTemp = EmpresaModel.fromJson(empresa);
        empresaTemp.id = id;

        datosEmpresa.add(empresaTemp);

      }

    });    

    // print(datosEmpresa[0].nomEmpresa);

    return datosEmpresa;

  }


}