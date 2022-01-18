import 'package:flutter/material.dart';
import 'config.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account Info',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const LinkTree(title: 'Account Info'),
    );
  }
}

class LinkTree extends StatefulWidget {
  const LinkTree({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<LinkTree> createState() => _LinkTreeState();
}

class _LinkTreeState extends State<LinkTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( 'Account info'),
      centerTitle: true,
      backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              const SizedBox(
              height: 70,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                
              color: Colors.grey[400],
              borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)        
                      )
                      ),
              child:
                  Image(image: NetworkImage(user['Profile'].toString())),
            ),

            Container(
              width: 150,
              height: 50,
              color: Colors.yellow,
              child: const Center(
                child: Text('Looking for a job'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(user['name']),
            const SizedBox(
              height: 10,
            ),
            Text(user['title']),
            const SizedBox(
              height: 10,
            ),
            Text(user['location']),
            const Divider(
              color: Colors.black,
            ),
            Text(user['bio']),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: ListView(children: generateLiks(user['links'])),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
                child: ListView(
                scrollDirection: Axis.horizontal,
                children: generateContacts(user['contacts']),
              ),
            ))
          ],
        ),
      ),
    );
  }

  List<Widget> generateLiks(List<Map<String, String>> links) {
    List<Widget> linkss = [];
    for (int i = 0; i < links.length; i++) {
      linkss.add(ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.yellow),
          onPressed: () async {
            await launch(links[i]['link'].toString());
          },
          child: Text(links[i]['title'].toString()  )));
            
    }

    return linkss;
  }

  List<Widget> generateContacts(contacts) {
    List<Widget> contactss = [];
    for (int i = 0; i < contacts.length; i++) {
      var title = contacts[i]['title'];

      contactss.add(IconButton(
        onPressed: () async {
          await launch(title + '' + contacts[i]['value']);
        },
        icon: Image.network('https://th.bing.com/th/id/R.07c0f4755e64e92afb203d9412423a05?rik=nJjd8%2blYX4ah%2bg&riu=http%3a%2f%2fpngimg.com%2fuploads%2fviber%2fviber_PNG25.png&ehk=PmZ2AleyZ5Q8eA4RqTK88no6ozRzeej1QHnGwZ9vu7Q%3d&risl=&pid=ImgRaw&r=0'),
      ));
    }
    return contactss;
  }
}