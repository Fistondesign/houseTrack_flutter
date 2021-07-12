import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './callback.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [];
  var dataAvailable = false;

  var _selectedIndex = 0;

  void _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    _loaddata();
  }

  _loaddata() async {
    var response = await Callback().getData('listhouses');
    var body = jsonDecode(response.body);
    var datas = body['data'];

    if (datas.length > 0) {
      setState(() {
        data = datas;
        dataAvailable = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataAvailable
          ? Padding(padding: EdgeInsets.all(0), child: _content())
          : Center(
              child: SpinKitFadingCircle(
                color: Colors.black,
                size: 50.0,
              ),
            ),
    );
  }

  Widget _content() {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: 5),
          itemCount: data.length,
          itemBuilder: (context, int) {
            return _card(
                data[int]['house_id'],
                data[int]['thumbnail'],
                data[int]['price'],
                data[int]['bedrooms'],
                data[int]['bathrooms'],
                data[int]['type'],
                data[int]['saletype']);
          }),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  Widget _card(houseId, image, price, bedrooms, bathrooms, type, houseIsfor) {
    return SizedBox(
      height: 420.0,
      child: Card(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 270.0,
            child: SizedBox(
                width: 100,
                height: 30,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(houseIsfor),
                    color: Colors.green,
                  ),
                )),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Callback().urltohouseimages + image),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
              width: double.infinity,
              height: 140.0,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(10.0),
                      height: 40.0,
                      width: double.infinity,
                      child: Text(type,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      height: 40.0,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(
                            Icons.donut_small_sharp,
                            color: Colors.green,
                          ),
                          SizedBox(width: 10),
                          Text(price + ' RWF/mo',
                              style: TextStyle(color: Colors.green)),
                          SizedBox(width: 20),
                          Text(
                            bedrooms,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.king_bed_outlined),
                          SizedBox(width: 20),
                          Text(
                            bathrooms,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.bathtub_outlined),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    height: 60.0,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        height: 40,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'detail',
                                  arguments: {'itemId': houseId});
                            },
                            child: Text(
                              'More Detail',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white))
        ]),
        elevation: 5,
      ),
    );
  }
}
