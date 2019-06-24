import 'dart:convert';

import 'package:estacionapp/models/Espacio_model.dart';
import 'package:http/http.dart' as http;

class EspacioProvider{

  final String _url = 'https://estacionapp-3e428.firebaseio.com';
  


  Future<bool> editarEstadoEspacio(EspacioModel espacio) async{

    // print(espacio.estadoEspacio);

    final url = '$_url/espacio/${espacio.id}.json';

    final resp = await http.put(url,body: espacioModelToJson(espacio));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }


  Future<List<EspacioModel>> cargarEspacio(String idPiso) async{

    final url = '$_url/espacio.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<EspacioModel> datosEspacio = new List();

    // final empresaList = new EmpresaProvider().cargarEmpresa();

    // final idEmpresa = await empresaList.then((erg)=>(erg[0].id));

    // final sedeList = new SedeProvider().cargarSede();
    // final idSede = await sedeList.then((erg) => (erg[0].id));

  

    // print(idEmpresa);
    
    

    // print(decodedData);    

    if(decodedData == null) return [];

    decodedData.forEach((id,espacio){

      // print(id);
      // print(Espacio['idEmpresa']);
      

      if(espacio['idPiso'] == idPiso){
        
        
        final espacioTemp = EspacioModel.fromJson(espacio);
        espacioTemp.id = id;
        datosEspacio.add(espacioTemp);

      }

      

      

    });    

    // print(datosEspacio[0].nombreEspacio);

    return datosEspacio;
    // return [];

  }

  

}