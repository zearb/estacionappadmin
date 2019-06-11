import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.directions_car,size: 45.0,)
          ),
        title: Text('EstacionAppAdmin'),
        backgroundColor: Color.fromRGBO(249, 170, 51, 1),
      ),
      body: Container(
        color: Color.fromRGBO(73, 101, 113, 1),        
        child: ListView(
          padding: EdgeInsets.all(27.0),
          children: <Widget>[
            Text('Seleccione la sede: ',style: TextStyle(color: Colors.white, fontSize:28.0),),
            SizedBox(height:30.0 ,),
            _cardTipo1('San Isidro','Av. Salaverry'),
            SizedBox(height:15.0 ,),
            _cardTipo1('Miraflores','Av. Benavides'),
            SizedBox(height:15.0 ,),
            _cardTipo1('La Molina','Av. La Fontana'),
                    ],
                  ),
      )
                
        );
    }


      Widget _cardTipo1(String title,String subtitle) {

          return Card(
            color: Color.fromRGBO(73, 73, 81, 1),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(20.0),
                  leading: Icon(Icons.location_on,color: Colors.blueAccent,),
                  title: Text(title,style: TextStyle(color: Colors.white, fontSize:25.0),),
                  subtitle: Text(subtitle,style: TextStyle(color: Colors.white,fontSize: 15.0),textAlign: TextAlign.end,),
                )
              ],
            ),
          );

      }


       }
          
