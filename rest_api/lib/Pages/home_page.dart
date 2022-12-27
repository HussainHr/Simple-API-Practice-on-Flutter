import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/Pages/about_page.dart';

import '../ModelClass/PostModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this is the variable for PostModel,,,,,,
  List<PostModel> modelList = [];

  // getting postModel from api,,,,
  Future<List<PostModel>> getPostApi() async {
    // this line for url for api
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    //convert json to string
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      modelList.clear();
      for (Map i in data) {
        modelList.add(PostModel.fromJson(i));
      }
      return modelList;
    } else {
      return modelList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Rest Api by Asif Taj'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child:  Text('Loading....'));
                } else {
                  return ListView.builder(
                    itemCount: modelList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                             const Text('Title',style: TextStyle(fontWeight:FontWeight.bold),),
                              Text(modelList[index].title.toString()),
                              SizedBox(height: 5,),
                            const  Text('Description',style: TextStyle(fontWeight:FontWeight.bold),),
                              Text(modelList[index].body.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
