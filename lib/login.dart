import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'callback.dart';
import 'dart:convert';

class Login extends StatefulWidget{
  @override
  _Login createState() => _Login();
}
class _Login extends State<Login>
{
  TextEditingController namesController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController locationController=TextEditingController();
  TextEditingController suggestionController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var message="";

   _submit() async{


    var data=new Map <String,String>();
       data['names']=namesController.text.toString();
       data['phone']=phoneController.text.toString();
       data['price']=priceController.text.toString();
       data['location']=locationController.text.toString();
       data['suggestion']=suggestionController.text.toString();

    var response=await Callback().postData('customer',data);
    var respo=response.statusCode;
     if(respo==200)
     {
       this._formKey.currentState.reset();
       namesController.clear();
       phoneController.clear();
       priceController.clear();
       locationController.clear();
       suggestionController.clear();
       setState(() {
         message="Successfull Sent";
       });
     }

   }

  @override
  Widget build(BuildContext context)
  {
    
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child:Container(
          width:double.infinity,
          child:Column(
            children: [
               _header(),
               _form()
            ],
          ),
        ),
      ),
    );
  }
  Widget _header()
  {
       return SizedBox(
         height:105,
         child:Card(
           child:Center(child: Column(
             children:[
               Text('Request Form',style:TextStyle(color:Colors.lightBlueAccent,fontSize:20)),
               SizedBox(height:10,),
               Text('You can make request of the house you want'),
               SizedBox(height:10),
               Text('And find it for you and contact you as soon as possible!')
             ]
           ),),
         ),
       );
  }

  Widget _form()
  {
    return Container(
      width:double.infinity,
      child:Card(
      child:Padding(
        padding:EdgeInsets.all(10),
        child:Form(
          key:_formKey,
        child:Column(
        children: [

        TextField(
          controller:namesController,
          decoration:InputDecoration(
            labelText:'Enter Names'
          )
        ),

        SizedBox(height:10),
        TextField(
          controller:phoneController,
          keyboardType:TextInputType.phone,
          decoration:InputDecoration(
            labelText:'Phone',
          ),
        ),

        SizedBox(height:10),
        TextField(
          controller:priceController,
          keyboardType:TextInputType.number,
          decoration:InputDecoration(
            labelText:'Price',
          ),
        ),

        SizedBox(height:10),
        TextField(
          controller:locationController,
          keyboardType:TextInputType.text,
          decoration:InputDecoration(
            labelText:'Location',
          ),
        ),

        SizedBox(height:10),
        TextField(
          controller:suggestionController,
          keyboardType:TextInputType.text,
          decoration:InputDecoration(
            labelText:'Suggestion',
          ),
        ),
        SizedBox(height:20),
        Text('$message',style:TextStyle(color:Colors.green,fontSize:15),),
        SizedBox(height:20),
         RaisedButton(onPressed:_submit,child:Text('Submit',style:TextStyle(color:Colors.white)),color:Colors.lightBlueAccent,)

 
      ],
      )
      ),
      ),
    ),
    );
  }
}