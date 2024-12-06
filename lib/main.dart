import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controllerNumero1 =
      TextEditingController(text: '');
  final TextEditingController controllerNumero2 =
      TextEditingController(text: '');

  double result = 0;
  String operaciones = '';

  void calculadora(String tipoOperacion) {
    double n1 = double.parse(controllerNumero1.text);
    double n2 = double.parse(controllerNumero2.text);
    setState(() {
      operaciones = tipoOperacion;
      switch (tipoOperacion) {
        case 'suma':
          result = n1 + n2;
          break;
        case 'resta':
          result = n1 - n2;
          break;
        case 'multiplicación':
          result = n1 * n2;
          break;
        case 'división':
          if (n2 == 0) {
            operaciones = 'Error';
            result = double.nan; // Puedes usar esto si quieres que el resultado sea NaN
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Error"),
                  content: const Text("División entre 0 no se puede"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                );
              },
            );
          } else {
            result = n1 / n2;
          }
          break;
        default:
          result = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 125, 230),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(50),
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage('assets/images/casio.jpeg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: TextField(
                      controller: controllerNumero1,
                      decoration: const InputDecoration(
                        labelText: 'Número 1:',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 1, 61, 149),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Ingrese el número 1',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: TextField(
                      controller: controllerNumero2,
                      decoration: const InputDecoration(
                        labelText: 'Número 2:',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 1, 61, 149),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Ingrese el número 2',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 1, 61, 149),
                          width: 1.4,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: Text(
                          'La $operaciones es: ${result.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 1, 61, 149),
                            fontSize: 19.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              calculadora('suma');
                            });
                          },
                          color: const Color.fromARGB(255, 1, 61, 149),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39.0),
                          ),
                          minWidth: 60.0,
                          height: 38.0,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              calculadora('resta');
                            });
                          },
                          color: const Color.fromARGB(255, 1, 61, 149),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39.0),
                          ),
                          minWidth: 60.0,
                          height: 38.0,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              calculadora('multiplicación');
                            });
                          },
                          color: const Color.fromARGB(255, 1, 61, 149),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39.0),
                          ),
                          minWidth: 60.0,
                          height: 38.0,
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              calculadora('división');
                            });
                          },
                          color: const Color.fromARGB(255, 1, 61, 149),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39.0),
                          ),
                          minWidth: 60.0,
                          height: 38.0,
                          child: const Text(
                            '/',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          controllerNumero1.clear();
                          controllerNumero2.clear();
                          result = 0;
                          operaciones = '';
                        });
                      },
                      color: const Color.fromARGB(255, 1, 61, 149),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      minWidth: 114.0,
                      height: 40.0,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Limpiar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
