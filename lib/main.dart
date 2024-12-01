import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController();
  static const String KEYNAME = 'Name';
  var nameValue= "No value saved";


  @override
  void initState() {

    super.initState();
    getValue();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 11),
            ElevatedButton(
              onPressed: () async{
                // Handle save action here

                String name = nameController.text.toString();
                var prefs= await  SharedPreferences.getInstance();

                // add the value
                prefs.setString(KEYNAME, name);

              },
              child: Text('Save'),
            ),
            SizedBox(height: 11),
            Text( nameValue),
          ],
        ),
      ),
    );
  }








  void getValue()async {

    var prefs= await  SharedPreferences.getInstance();
    // get value
    var getName= prefs.getString(KEYNAME);

    setState(() {
      nameValue = getName?? "No value saved" ;
    });
  }
}