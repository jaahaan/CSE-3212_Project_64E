import 'package:flutter/material.dart';
import 'package:project_64e/card_page.dart';
import 'package:project_64e/container_page.dart';
import 'package:project_64e/converter_page.dart';
import 'package:project_64e/gridview_page.dart';
import 'package:project_64e/listview_page.dart';
import 'package:project_64e/note_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _supabase = Supabase.instance.client;
  Future<Map<String, dynamic>?> getCurrentUser() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;
    final res =
        await _supabase.from('profiles').select().eq('id', user.id).single();
    return res;
  }

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
          IconButton(
            onPressed: () {
              _supabase.auth.signOut();
            },
            icon: Icon(Icons.logout),
          ),
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                }
                if (!snapshot.hasData) {
                  return const Text("No User Found!!");
                }
                final profile = snapshot.data as Map<String, dynamic>;
                return SizedBox(
                  width: 300,
                  height: 100,
                  child: Card(
                    color: Color.fromARGB(255, 157, 170, 82),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Name: ${profile['name']}"),
                        Text("Email: ${profile['email']}"),
                        if (profile['avatar_url'] != null)
                          Image.network(profile['avatar_url']),
                      ],
                    ),
                  ),
                );
              },
            ),
            Image.asset("assets/images/flutter.png", width: 150, height: 150),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListviewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 157, 170, 82),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    fixedSize: Size(150, 50),
                  ),
                  child: Text("ListView"),
                ),

                SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridviewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 157, 170, 82),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    fixedSize: Size(150, 50),
                  ),
                  child: Text("GridView"),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConverterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 157, 170, 82),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    fixedSize: Size(150, 50),
                  ),
                  child: Text("Converter"),
                ),

                SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 157, 170, 82),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    fixedSize: Size(150, 50),
                  ),
                  child: Text("Note"),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CardPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 157, 170, 82),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    fixedSize: Size(150, 50),
                  ),
                  child: Text("Card Page"),
                ),

                SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContainerPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 157, 170, 82),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    fixedSize: Size(150, 50),
                  ),
                  child: Text("Container Page"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
