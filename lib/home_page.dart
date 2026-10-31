import 'package:flutter/material.dart';
import 'package:project_64e/card_page.dart';
import 'package:project_64e/container_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        backgroundColor: const Color.fromARGB(255, 157, 170, 82),
        foregroundColor: Colors.white,
        // leading: Icon(Icons.home),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 157, 170, 82),
              ),
              accountName: Text("Name"),
              accountEmail: Text("Email"),
              currentAccountPicture: Icon(Icons.person_2),
            ),

            ListTile(
              trailing: Icon(Icons.home),
              hoverColor: const Color.fromARGB(255, 157, 170, 82),
              title: Text("Homepage"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.call),
              hoverColor: const Color.fromARGB(255, 157, 170, 82),
              title: Text("Container"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContainerPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.feedback),
              hoverColor: const Color.fromARGB(255, 157, 170, 82),
              title: Text("FeedBack"),
              onTap: () {},
            ),
            Spacer(),
            Text("Copyright"),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 157, 170, 82),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        tooltip: "Message",
        child: Icon(Icons.message),
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContainerPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 227, 235, 235),
                    foregroundColor: Colors.cyan,
                    side: BorderSide(color: Colors.cyan, width: 3),
                    fixedSize: Size(100, 30),
                    elevation: 2,
                    shadowColor: Colors.cyan,
                  ),
                  child: Text("Container"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CardPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 227, 235, 235),
                  foregroundColor: Colors.green,
                  side: BorderSide(color: Colors.greenAccent, width: 3),
                  fixedSize: Size(100, 30),
                ),
                child: Text("Card"),
              ),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Blue Button Clicked")),
                  );
                },
                child: Text("Blue"),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.alarm)),
            ],
          ),

          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(color: Colors.lightGreen),
            child: Text("Welcome 64E"),
          ),
        ],
      ),
    );
  }
}
