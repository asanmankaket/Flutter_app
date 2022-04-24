import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/config.dart';
import 'package:flutter_appcare/views/carddetail.dart';
import 'package:http/http.dart' as http;

import '../models/sidemenu.dart';

class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController username = TextEditingController();
  @override
  dynamic data;

  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await Getdata();
    print(item?.first);
    setState(() {
      data = item;
    });
  }

  List<Map<String, String>> item = [
    {
      'title': 'นาย',
      'fname': 'นัท',
      'lname': 'มั้ง',
      'phone': '0897897979',
      'image': 'eqweqweqwf'
    },
    {
      'title': 'นาย',
      'fname': 'อาซาน',
      'lname': 'มรรคาเขต',
      'phone': '0897897979',
      'image': 'eqweqweqwf'
    },
    {
      'title': 'นาย',
      'fname': 'สองแสน',
      'lname': 'รามคำแหง',
      'phone': '0897897979',
      'image': 'eqweqweqwf'
    },
    {
      'title': 'นาย',
      'fname': 'อำเภอ',
      'lname': 'สงขลา',
      'phone': '0897897979',
      'image': 'eqweqweqwf'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 227, 227),
      appBar: AppBar(
        title: Text('Page1'),
        backgroundColor: Color.fromARGB(255, 45, 134, 156),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RefreshIndicator(
            onRefresh: () async {
              startApi();
            },
            child: ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, i) => InkWell(
                // onTap: () => Navigator.pushNamed(context, "/CDT"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              Carddetail(data: data[i])));
                },
                child: Card(
                  elevation: 10,
                  color: Color.fromARGB(255, 150, 217, 234),
                  shadowColor: Color.fromARGB(255, 10, 91, 111),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 55.0,
                                height: 55.0,
                                // color: Color.fromARGB(255, 150, 217, 234),
                                // ignore: prefer_const_constructors
                                child: CircleAvatar(
                                  // backgroundColor:
                                  //     Color.fromARGB(255, 150, 217, 234),
                                  // foregroundColor:
                                  //     Color.fromARGB(255, 150, 217, 234),
                                  // ignore: prefer_const_constructors
                                  backgroundImage:
                                      AssetImage('assets/images/Delete.png'),
                                  // backgroundImage: NetworkImage(
                                  //     "https://obs.line-scdn.net/0ho7Hx9FjJMBh1ARpkc9xPT09XM3dGbSMbETdhGylvbiwKMSRPGm4vLVlVO3oNOXdGG297dlEAKylQNXFMSmEv/w644"),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'title : ${data[i]['title']}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      'fname: ${data[i]['fname']}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      'lname : ${data[i]['lname']}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      'phone : ${data[i]['phone']}',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])
                      ]),
                ),
              ),
            ),
          )),
      drawer: SideMenu(),
    );
  }
}

Future<dynamic> Getdata() async {
  Uri url = Uri.parse('http://192.168.1.36:3000/api/mentor');
  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      print('error');
      return null;
    }
  });
}
