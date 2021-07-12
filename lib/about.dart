import 'package:flutter/material.dart';

class About extends StatefulWidget{
  @override
  _About createState() => _About();
}
class _About extends State<About>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child:Column(children: [
        SizedBox(
          width:double.infinity,
          child:Card(
            child:Column(
              children:
              [
                SizedBox(height:20),
                 Container(
                   child:Text('About us',style:TextStyle(color:Colors.blueAccent,fontSize:20))
                 ), 
                 SizedBox(height:10),
                 Container(
                   padding:EdgeInsets.all(10),
                   child:Text('Colibusela ltd is a coperative ',style:TextStyle(fontSize:15))
                 ),
                   Container(
                   padding:EdgeInsets.all(10),
                   child:Text('That offering house renting sinze 2015',style:TextStyle(fontSize:15))
                 ),
                 SizedBox(height:10),
                  Container(
                   child:Text('OUR MISSION',style:TextStyle(color:Colors.blueAccent,fontSize:17))
                 ),
                  Container(
                   padding:EdgeInsets.all(10),
                   child:Text('Our mission is to offer our clients better service')
                 ),
                 SizedBox(height:10,),
                  Container(
                   child:Text('Location',style:TextStyle(color:Colors.blueAccent,fontSize:17))
                 ),
                  Container(
                   padding:EdgeInsets.all(10),
                   child:Text('Rwanda')
                 ),
                  Container(
                   padding:EdgeInsets.all(10),
                   child:Text('Nothern Province')
                 ),
                  Container(
                   padding:EdgeInsets.all(10),
                   child:Text('Musanze District')
                 ),
                  Container(
                   padding:EdgeInsets.all(10),
                   child:Text('Muhoza Sector')
                 ),
                 Container(
                   padding:EdgeInsets.all(10),
                   child:Text('Street : 125NM')
                 ),
                SizedBox(height:20),
                 Container(
                   child:Text('Contact us',style:TextStyle(color:Colors.blueAccent,fontSize:20))
                 ), 
                 Container(
                   padding:EdgeInsets.all(10),
                   child:Text('Email:colibusela2015@gmail.com')
                 ),
                  Container(
                   padding:EdgeInsets.all(10),
                   child:Text('Phone:+(250)782463450/785670232')
                 ),
              ],
            ),
          ),
        )
      ],
      ),
      )
    );
  }
}