import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './callback.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Detail extends StatefulWidget {
  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  GoogleMapController myController;

  List<Marker> _markers = <Marker>[];

  var _arguments;
  var dataholder;
  var dataAvailable = false;

  static final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _arguments = ModalRoute.of(context).settings.arguments;
      _loadData(_arguments['itemId']);
    });
  }

  _loadData(itemId) async {
    var response = await Callback().getData('housedetail/$itemId');
    var data = await json.decode(response.body.toString());
    var finalResponse = data['data'];

    var lat = double.parse(finalResponse[0]['lat']);
    var long = double.parse(finalResponse[0]['longi']);

    setState(() {
      dataholder = finalResponse;
      dataAvailable = true;
    });
    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: finalResponse[0]['city'])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Detail Page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: dataAvailable
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical, child: _content())
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
      width: double.infinity,
      child: Column(children: [_header(), _texts()]),
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                Callback().urltohouseimages + dataholder[0]['thumbnail']),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _texts() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 0.0, right: 0.0),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(color: Colors.white),
          child: Card(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Icon(
                    Icons.donut_small_sharp,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Text(dataholder[0]['price'] + ' RWF/mo',
                      style: TextStyle(color: Colors.green)),
                  SizedBox(width: 20),
                  Text(
                    dataholder[0]['bedrooms'],
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.king_bed_outlined),
                  SizedBox(width: 20),
                  Text(
                    dataholder[0]['bathrooms'],
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.bathtub_outlined),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Row(children: [
                    Icon(Icons.home, color: Colors.green),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'House is:',
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(dataholder[0]['type']),
                  ]),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(children: [
                    Icon(Icons.home, color: Colors.green),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'House is:',
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(dataholder[0]['saletype']),
                  ]),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(children: [
                    Icon(Icons.home, color: Colors.green),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      dataholder[0]['bedrooms'],
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Bed Rooms'),
                  ]),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(children: [
                    Icon(Icons.home, color: Colors.green),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      dataholder[0]['bathrooms'],
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Bath Rooms'),
                  ]),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text('Contact Blocker')
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[10],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10),
                          child: FlatButton.icon(
                              onPressed: () {
                                launch(
                                    ('tel://${dataholder[0]['agent_phone']}'));
                              },
                              icon: Icon(Icons.phone),
                              label: Text('')),
                          decoration: BoxDecoration(
                              color: Colors.grey[100], shape: BoxShape.circle),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10),
                          child: FlatButton.icon(
                              onPressed: () {
                                launch(
                                    ('sms://${dataholder[0]['agent_phone']}'));
                              },
                              icon: Icon(Icons.sms),
                              label: Text('')),
                          decoration: BoxDecoration(
                              color: Colors.grey[100], shape: BoxShape.circle),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10),
                          child: FlatButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.email),
                              label: Text('')),
                          decoration: BoxDecoration(
                              color: Colors.grey[100], shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10),
                  child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.map),
                      label: Text('Location')),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 500.0,
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(_markers),
            initialCameraPosition: CameraPosition(
              target: LatLng(double.parse(dataholder[0]['lat']),
                  double.parse(dataholder[0]['longi'])),
              zoom: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}
