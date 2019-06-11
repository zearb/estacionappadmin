import 'package:estacionapp/Bloc/provider.dart';
import 'package:estacionapp/pages/HomePage.dart';
import 'package:estacionapp/pages/LoginPage.dart';
import 'package:estacionapp/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/material.dart';


void main() async{

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();


  runApp(MyApp());

} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'home' : (BuildContext context) => HomePage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      )
    );
    
    
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _restartCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estacionapp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }



   Widget _crearBotones(){
     
     
     return Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget>[
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: _restartCounter,heroTag: 'cero',),
        SizedBox(width: 5.0),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _decrementCounter,heroTag: 'Disminuir',),        
        SizedBox(width: 5.0),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _incrementCounter,heroTag: 'aumentar',),

       ],
     ); 
     
     
     



   }

}
