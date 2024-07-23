import 'dart:math';

import 'package:flutter/material.dart';

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
      home: const Jokenpo(title: 'Flutter Demo Home Page'),
    );
  }
}

class Jokenpo extends StatefulWidget {
  const Jokenpo({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Jokenpo> createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  final _imgPadrao = const Image(image: AssetImage('assets/images/padrao.png'));

  var _imgApp = const Image(image: AssetImage('assets/images/padrao.png'));
  var _imgAppMaquina =
      const Image(image: AssetImage('assets/images/padrao.png'));
  String _mensagem = 'Resultado';
  int numVitorias = 0;
  int numDerrotas = 0;
  int numEmpates = 0;

  String modoDeJogo = '';

  int selecionaDificuldade() {
    return 0;
  }

  void _joga(String opcaoJogador) {
    final listaOpcoes = ['pedra', 'papel', 'tesoura'];
    final opcaoApp = listaOpcoes[Random().nextInt(3)];

    setState(() {
      _imgApp = Image(image: AssetImage('assets/images/$opcaoJogador.png'));
      _imgAppMaquina = Image(image: AssetImage('assets/images/$opcaoApp.png'));
      _mensagem = _resultado(opcaoJogador, opcaoApp);
    });
  }

  String _resultado(String opcaoJogador, String opcaoApp) {

    if ((opcaoJogador == 'pedra' && opcaoApp == 'tesoura') ||
        (opcaoJogador == 'papel' && opcaoApp == 'pedra') ||
        (opcaoJogador == 'tesoura' && opcaoApp == 'papel')) {
      numVitorias++;
      return 'Jogador ganhou!!';
    } else if (opcaoApp == opcaoJogador) {
      numEmpates++;
      return 'Empate!!!';
    } else {
      numDerrotas++;
      return "A máquina ganhou!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Jokenpo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "É O JOKENPÔ DO LEANDRÃO",
                style: TextStyle(color: Colors.red, fontSize: 36),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: textHome(_mensagem),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                SizedBox(
                  width: 120,
                  child: Align(
                    alignment: Alignment.center,
                    child: textHome("Sua escolha"),
                  ),
                ),
                Align(alignment: Alignment.center, child: _imgApp),
              ]),
              const Column(
                children: [
                  Text(
                    "X",
                    textScaler: TextScaler.linear(3),
                  )
                ],
              ),
              Column(
                children: [
                  textHome("Escolha da máquina"),
                  Align(alignment: Alignment.centerRight, child: _imgAppMaquina)
                ],
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            choisePlayerDetector('pedra',
                image: Image.asset(
                  'assets/images/pedra.png',
                  width: 80,
                )),
            choisePlayerDetector('papel',
                image: Image.asset(
                  'assets/images/papel.png',
                  width: 80,
                )),
            choisePlayerDetector('tesoura',
                image: Image.asset(
                  'assets/images/tesoura.png',
                  width: 80,
                )),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              counterWrapCircle('Vitórias', numVitorias.toString()),
              counterWrapCircle('Empate', numEmpates.toString()),
              counterWrapCircle('Derrota', numDerrotas.toString()),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numVitorias = 0;
            numEmpates = 0;
            numDerrotas = 0;
            _imgApp = _imgPadrao;
            _imgAppMaquina = _imgPadrao;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.settings_backup_restore_sharp),
      ),
    );
  }

  Text textHome(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  GestureDetector choisePlayerDetector(String PlayerOpp, {Image? image}) {
    return GestureDetector(
      onTap: () => _joga(PlayerOpp),
      child: image,
    );
  }

  SizedBox counterWrapCircle(String textTop, String textBottom) {
    return SizedBox(
        height: 90,
        width: 90,
        child: ClipOval(
          child: Material(
            color: Theme.of(context).colorScheme.primary,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                textTop,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                textBottom,
              )
            ]),
          ),
        ));
  }
}
