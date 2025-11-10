import 'package:flutter/material.dart';

void main() {
  runApp(pointcounter());
}

class pointcounter extends StatefulWidget {
  @override
  State<pointcounter> createState() => _pointcounterState();
}

class _pointcounterState extends State<pointcounter> {
  int teamPointA = 0;

  int teamPointB = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Pointer app",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/884957395513151840.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 24),
                      Container(
                        height: 60,
                        width: 160,
                        child: Center(
                          child: Text(
                            "Team 1",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black, width: 5),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(206, 0, 0, 0),
                              blurRadius: 80,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "$teamPointA",
                        style: TextStyle(fontSize: 150, color: Colors.grey),
                      ),

                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            teamPointA++;
                            setState(() {});
                          },
                          child: Text(
                            "+ 1 point",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.greenAccent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            teamPointA = teamPointA + 2;
                            setState(() {});
                          },
                          child: Text(
                            "+ 2 point",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            teamPointA = teamPointA - 1;
                            setState(() {});
                          },
                          child: Text(
                            "- 1 point",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            teamPointA = teamPointA - 2;
                            setState(() {});
                          },
                          child: Text(
                            "- 2 point",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: const SizedBox(
                      height: 500,
                      width: 30,
                      child: VerticalDivider(color: Colors.white, thickness: 2),
                    ),
                  ),

                  Column(
                    children: [
                      const SizedBox(height: 24),
                      Container(
                        height: 60,
                        width: 160,
                        child: Center(
                          child: Text(
                            "Team 2",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black, width: 5),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(206, 0, 0, 0),
                              blurRadius: 80,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "$teamPointB",
                        style: TextStyle(fontSize: 150, color: Colors.grey),
                      ),

                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            teamPointB++;
                            setState(() {});
                          },
                          child: Text(
                            "+ 1 point",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.greenAccent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            teamPointB = teamPointB + 2;
                            setState(() {});
                          },
                          child: Text(
                            "+ 2 point",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            teamPointB--;
                            setState(() {});
                          },
                          child: Text(
                            "- 1 point",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            teamPointB = teamPointB - 2;
                            setState(() {});
                          },
                          child: Text(
                            "- 2 point",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    teamPointA = 0;
                    teamPointB = 0;
                    setState(() {});
                  },
                  child: Text(
                    "Restart",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 247, 163, 45),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
