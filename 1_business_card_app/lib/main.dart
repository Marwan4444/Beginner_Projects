import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Business Card',
            style: TextStyle(
              fontFamily:
                  'Playwrite Australia SA',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor:
              Colors.transparent,
          elevation: 80, 
          toolbarHeight: 50,
          titleSpacing: 15,
          leading: Icon(Icons.account_circle, color: Colors.white),
          actions: [
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.email),
              onPressed: () {},
              color: Colors.white,
            ),
          ],
          iconTheme: IconThemeData(color: Colors.white, size: 28),
          actionsIconTheme: IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 26, 189, 225),
                  Color.fromARGB(255, 108, 219, 206),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        backgroundColor: Color.fromARGB(255, 78, 185, 209),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 6),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(206, 0, 0, 0),
                      blurRadius: 70,
                      offset: Offset(0, 70),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      'images/WhatsApp_Image_2024-02-01_at_16.55.20_2b096f2c-removebg-preview (3).png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Marwan Tamer ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Playwrite Australia SA',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Software Engineer ',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 211, 202, 202),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Playwrite Australia SA',
                    ),
                  ),
                  Icon(
                    Icons.code,
                    size: 30,
                    color: const Color.fromARGB(255, 211, 202, 202),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(padding: const EdgeInsets.all(10)),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Icon(Icons.call, size: 30, color: Color(0xff2596be)),
                  ),
                  Text('    +20 (1027904990)', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Icon(Icons.mail, size: 30, color: Color(0xff2596be)),
                  ),
                  Text(
                    '    marawantamer95@gmail.com',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Icon(Icons.work, size: 30, color: Color(0xff2596be)),
                  ),
                  Text('    Marwan El-Hebishy', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
