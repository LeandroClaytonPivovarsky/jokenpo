import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Jokenpo"),
        ),
        body:const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child:  Text("Resultado",
                textScaler: TextScaler.linear(3),) ,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Sua escolha")
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image(
                            image: AssetImage('assets/images/padrao.png'),
                        ),
                      ),
                    ]),
                    Column(children: [
                      Text(
                        "X",
                        textScaler: TextScaler.linear(3),)
                    ],),

                    Column(children: [
                      Text("Escolha da máquina"),
                      Align(
                      alignment: Alignment.centerRight,
                      child: Image(
                        image: AssetImage('assets/images/padrao.png'))
                    )
                    ],)
                  ],),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: Image(
                      image: AssetImage('assets/images/pedra.png')),
                    
                  ),
                  SizedBox(
                    width: 80,
                    child: Image(
                      image: AssetImage('assets/images/papel.png')),
                    
                  ),
                  SizedBox(
                    width: 80,
                    child: Image(
                      image: AssetImage('assets/images/tesoura.png')),
                    
                  )
                ])
            ],
          )
      );
    
  }
}