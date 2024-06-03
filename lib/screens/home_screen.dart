import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_1_api/data/data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataModel? mData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodo();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("API TASK"),
          centerTitle: true,
        ),
        body: mData != null
            ? ListView.builder(
                itemCount: mData!.todos!.length, itemBuilder: (_, index) {
                  var todo = mData!.todos!;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: ListTile(
                      title: Text("${todo[index].todo}"),
                      subtitle: Text("User Id :- ${todo[index].userId}"),
                      leading: CircleAvatar(backgroundColor: Colors.amber,child: Text("${todo[index].id}"),),
                      tileColor: todo[index].completed! ? Colors.green : Colors.red,
                    ),
                  );
                    })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  getTodo() async {
    String url = "https://dummyjson.com/todo";
    var endpoint = Uri.parse(url);

    var response = await http.get(endpoint);

    if (response.statusCode == 200) {
      print(response.statusCode);
      var rawData = jsonDecode(response.body);

      print(rawData);

      mData = DataModel.fromJson(rawData);
      print(mData!.todos!.length);

      setState(() {});
    }
  }
}
