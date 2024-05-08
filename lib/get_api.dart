import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'get_data_model.dart';

class get_api extends StatefulWidget {
  const get_api({Key? key}) : super(key: key);

  @override
  State<get_api> createState() => _get_apiState();
}

class _get_apiState extends State<get_api> {
  String name = '';
  String roll = '';
  String marks = '';

  late GetApi getApi;

  void getApiData() async {
    final response = await http.get(Uri.parse("https://flutterapi.brotherdev.com/get_api.php"));
    getApi = getApiFromJson(response.body);

    setState(() {
      name = getApi.name;
      roll = getApi.roll;
      marks = getApi.marks;
    });
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff281537),
        title: Text(
          "Get Api",
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
        ), // Set background color here
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://avatars.githubusercontent.com/u/85007440?v=4",
                    fit: BoxFit.cover, // adjust this based on your needs
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text("Name : $name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Roll : $roll",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text("Marks : $marks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
