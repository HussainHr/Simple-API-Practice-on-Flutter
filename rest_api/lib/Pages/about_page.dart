import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/ModelClass/MyClass.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // this is variable for list
  List<MyClass> getModel = [];
  //getting data from api.....
  Future<List<MyClass>> getApiModel() async {
    //this code for url to fetch data
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    // convert json to string
    var item = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      getModel.clear();
      for (Map i in item) {
        getModel.add(MyClass.fromJson(i));
      }
      return getModel;
    } else {
      return getModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Complex Rest Api'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getApiModel(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('loadnig...'));
              } else {
                return ListView.builder(
                    itemCount: getModel.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              Text(getModel[index].name.toString()),
                              const SizedBox(
                                height: 5,),
                              const Text(
                                'Email',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              Text(getModel[index].email.toString()),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(getModel[index].body.toString()),
                            ],
                          ),
                        ),
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}
