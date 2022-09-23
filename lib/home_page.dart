import 'package:dutch_app/bloc/highway_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("D"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [Highway()],
          ),
        ),
      ),
    );
  }
}

class Highway extends StatelessWidget {
  const Highway({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Highway tool"),
              InkWell(
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HighwayToolCard extends StatelessWidget {
  const HighwayToolCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
