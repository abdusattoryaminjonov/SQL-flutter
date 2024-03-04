import 'package:flutter/material.dart';
import 'package:ngdemo12_sql/models/post_model.dart';
import 'package:ngdemo12_sql/services/sql_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String name = "No date!";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = Post(title: "Next", body: "Academy");
    //SqlService.createPost(post);
    loadPosts();
  }

  loadPosts() async{
    var posts = await SqlService.fetchPosts();
    setState(() {
      name = posts.first.toMap().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("SQL",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Text(name,style: TextStyle(fontSize: 30),),
      )
    );
  }
}
