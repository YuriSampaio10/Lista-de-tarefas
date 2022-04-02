import 'package:projeto_contador/main.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void incremnt() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isempty => count == 0;
  bool get isfull => count == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/image.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ), // adicionar imagem
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isfull ? 'por favor espere' : 'pode entrar',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(70),
              child: Column(
                children: [
                  Text(
                    'Número de pessoas',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 100,
                      color: isfull ? Colors.red : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15, // widget invisivel para separar os os textos
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isempty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isempty
                        ? Colors.white.withOpacity(0.3)
                        : Colors.white, // cor botão
                    fixedSize: const Size(100, 100), //espaçamento do botão
                    primary: Colors.black, // cor quando clica no botão
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // arredonda bordas
                    ),
                  ),
                  child: Text(
                    'saiu',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50, // widget invisivel para separar os botões
                ),
                TextButton(
                  onPressed: isfull ? null : incremnt,
                  style: TextButton.styleFrom(
                    backgroundColor: isfull
                        ? Colors.white.withOpacity(0.3)
                        : Colors.white, // cor botão
                    fixedSize: const Size(100, 100), //espaçamento do botão
                    primary: Colors.black, // cor quando clica no botão
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // arredonda bordas
                    ),
                  ),
                  child: Text(
                    'entrou',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
