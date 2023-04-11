import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basit ToDo Uygulaması",
      home: Iskele(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List Uygulaması"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<Map<String, dynamic>> Liste = [];

  elemanEkle() {
    if (t1.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lütfen bir metin girin.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      Liste.add({
        "text": t1.text,
        "checked": false,
      });
      t1.clear();
    });
  }

  elemanCikar(int index) {
    setState(() {
      Liste.removeAt(index);
    });
  }

  toggleCheck(int index) {
    setState(() {
      Liste[index]["checked"] =
          !Liste[index]["checked"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: t1,
          ),
          ElevatedButton(
            onPressed: elemanEkle,
            child: Text("Ekle"),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: Liste.length,
              itemBuilder: (context, siraNumarasi) {
                return ListTile(
                  title: Text(
                    Liste[siraNumarasi]["text"],
                    style: TextStyle(
                      color: Liste[siraNumarasi]["checked"]
                          ? Colors.green
                          : null,
                    ),
                  ),
                  subtitle: Text("bla bla"),
                  leading: Checkbox(
                    value: Liste[siraNumarasi]["checked"],
                    onChanged: (value) => toggleCheck(siraNumarasi),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => elemanCikar(siraNumarasi),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
