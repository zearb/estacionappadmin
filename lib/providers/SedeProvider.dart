import 'dart:convert';

import 'package:estacionapp/providers/EmpresaProvider.dart';
import 'package:http/http.dart' as http;
import 'package:estacionapp/models/sede_model.dart';

class SedeProvider{

  final String _url = 'https://estacionapp-3e428.firebaseio.com';
  



  Future<List<SedeModel>> cargarSede() async{

    final url = '$_url/sucursal.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<SedeModel> datosSede = new List();

    final empresaList = new EmpresaProvider().cargarEmpresa();

    final idEmpresa = await empresaList.then((erg)=>(erg[0].id));

  

    // print(idEmpresa);
    
    

    // print(decodedData);    

    if(decodedData == null) return [];

    decodedData.forEach((id,sede){

      // print(id);
      // print(sede['idEmpresa']);
      

      if(sede['idEmpresa'] == idEmpresa){
        
        
        final sedeTemp = SedeModel.fromJson(sede);
        sedeTemp.id = id;
        datosSede.add(sedeTemp);

      }

      

      

    });    

    // print(datosSede[0].nomSede);

    return datosSede;
    // return [];

  }

  

}