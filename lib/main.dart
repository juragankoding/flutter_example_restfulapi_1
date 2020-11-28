import 'package:example_rest_full_api_1/lib_net.dart';
import 'package:flutter/material.dart';

import 'package:example_rest_full_api_1/model/list.dart' as listRestful;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<listRestful.List>>(
          future: Connection.getInstance().getListMenu(),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    listRestful.List listData = snapshot.data[index];

                    return GestureDetector(
                      onTap: () {
                        // persiapan untuk tutorial kedua
                      },
                      child: Center(
                        child: Container(
                          width: 200,
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            listData.name.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
