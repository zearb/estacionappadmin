import 'dart:convert';

import 'package:estacionapp/models/piso_model.dart';
// import 'package:estacionapp/providers/EmpresaProvider.dart';
import 'package:http/http.dart' as http;

class PisoProvider{

  final String _url = 'https://estacionapp-3e428.firebaseio.com';
  



  Future<List<PisoModel>> cargarPiso(String idZona) async{

    final url = '$_url/piso.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<PisoModel> datosPiso = new List();

    // final empresaList = new EmpresaProvider().cargarEmpresa();

    // final idEmpresa = await empresaList.then((erg)=>(erg[0].id));

    // final sedeList = new SedeProvider().cargarSede();
    // final idSede = await sedeList.then((erg) => (erg[0].id));

  

    // print(idEmpresa);
    
    

    // print(decodedData);    

    if(decodedData == null) return [];

    decodedData.forEach((id,piso){

      // print(id);
      // print(Piso['idEmpresa']);
      

      if(piso['idZona'] == idZona){
        
        
        final pisoTemp = PisoModel.fromJson(piso);
        pisoTemp.id = id;
        datosPiso.add(pisoTemp);

      }

      

      

    });    

    // print(datosPiso[0].nombrePiso);

    return datosPiso;
    // return [];

  }

  

}