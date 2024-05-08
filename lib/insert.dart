import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'get_api.dart';

class InsertApi extends StatefulWidget {
  const InsertApi({Key? key}) : super(key: key);

  @override
  State<InsertApi> createState() => _InsertApiState();
}

class _InsertApiState extends State<InsertApi> {
  TextEditingController name = TextEditingController();
  TextEditingController roll = TextEditingController();
  TextEditingController marks = TextEditingController();

  Future<void> insertApi() async {
    final response = await http.post(
      Uri.parse("https://flutterapi.brotherdev.com/post_insert_api.php"),
      body: jsonEncode(<String, dynamic>{
        "name": name.text,
        "roll": roll.text,
        "marks": marks.text,
      }),
    );

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff281537),
        leading: Icon(Icons.home,
            color: Colors.white
        ),
        title: Text(
          "Insert Api",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]
          ),
        ), // Set your desired background color here
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 80),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                  color: Colors.white,
                ),
                child:
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Padding for text input
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                    border: InputBorder.none, // Hide the default border
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                  color: Colors.white,
                ),
                child:
                TextField(
                  controller: roll,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Padding for text input
                    labelText: 'Roll',
                    labelStyle: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                    border: InputBorder.none, // Hide the default border
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                  color: Colors.white,
                ),
                child:
                TextField(
                  controller: marks,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Padding for text input
                    labelText: 'Marks',
                    labelStyle: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                    border: InputBorder.none, // Hide the default border
                  ),
                ),
              ),
              SizedBox(height: 50),

              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 150, height: 40),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    insertApi();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => get_api()));
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
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
