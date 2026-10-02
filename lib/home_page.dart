import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              title: Text("Contact Me"),
              onTap: () {},
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

      body: Text(
        "Hello, Welcome to our class",
        style: GoogleFonts.lobster(
          textStyle: TextStyle(fontSize: 20, color: Colors.indigoAccent),
        ),
      ),
    );
  }
}
