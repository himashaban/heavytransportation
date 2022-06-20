import 'dart:async';
import 'package:flutter/material.dart';
import 'package:heavytransportship/screens/payment.dart';

class truckorder extends StatefulWidget {

  @override
  State<truckorder> createState() => _truckorderState();
}

class _truckorderState extends State<truckorder> {

  DateTime date=DateTime(2022,1,1);

  String title ='Time Picker';
  TimeOfDay _time=TimeOfDay.now();
  @override
  void initState(){
    super.initState();
    _time=TimeOfDay.now();

  }
  String tovalue = 'Giza';

  // List of items in our dropdown menu
  var to = [
    'Cairo',
    'Giza',
    'Sharm El Sheikh',
    'Suez',
    'Aswan',
    'Alexandria',
    'Hurgada',
    'Luxor'
  ];
  String fromvalue = 'Cairo';

  // List of items in our dropdown menu


  int price=0;
  var from = [
  'Cairo',
  'Giza',
  'Sharm El Sheikh',
  'Suez',
  'Aswan',
  'Alexandria',
  'Hurgada',
  'Luxor'];
  String sizevalue = 'Small';

  // List of items in our dropdown menu
  var size= [
    'Small',
    'Medium',
    'Heavy',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar:AppBar(
          backgroundColor: Color(0xfffafafa),
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: // Ex.Fex
          RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                        style: const TextStyle(
                            color:  const Color(0xffff6e00),
                            fontWeight: FontWeight.w300,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 32.0
                        ),
                        text: "                    Ex."),
                    TextSpan(
                        style: const TextStyle(
                            color:  const Color(0xffff6e00),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 32.0
                        ),
                        text: ".F"),
                    TextSpan(
                        style: const TextStyle(
                            color:  const Color(0xffff6e00),
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 32.0
                        ),
                        text: "ex")
                  ]
              )
          )
      ),


      body: Container(
        alignment: Alignment.center,
        height: double.maxFinite,
        width: double.maxFinite,

        child: Center(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [





                      Text("choose size of the truck",
                        style: const TextStyle(
                          color:  const Color(0xff2e384d),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto",
                          fontStyle:  FontStyle.normal,
                          fontSize: 24.0,
                        ),

                      ),



              DropdownButton(

                // Initial Value
                value: sizevalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: size.map((String size) {
                  return DropdownMenuItem(
                    value: size,
                    child: Text(size),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValuee) {
                  setState(() {
                    sizevalue = newValuee!;
                  });
                },
              ),


              SizedBox(height: 20,),
              Container(
                width: 357.962890625,
                height: 52.6416015625,
                decoration: new BoxDecoration(
                    color: Color(0x33e0e7ff),
                    borderRadius: BorderRadius.circular(5)
                ),
                child:Row(
                  children: [Text("from:   "),
                    DropdownButton(



                      value: fromvalue,


                      icon: const Icon(Icons.keyboard_arrow_down),


                      items: from.map((String from) {
                        return DropdownMenuItem(
                          value: from,
                          child: Text(from),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          fromvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),

              ),


              SizedBox(height: 20,),




              ClipOval(

                child: Icon(Icons.import_export_sharp, size:50,),
              ),





              Container(
                width: 357.962890625,
                height: 52.6416015625,
                decoration: new BoxDecoration(
                    color: Color(0x33e0e7ff),
                    borderRadius: BorderRadius.circular(5)
                ),
                child:Row(
                  children: [Text("to:   "),
                    DropdownButton(


                      value: tovalue,


                      icon: const Icon(Icons.keyboard_arrow_down),


                      items: to.map((String to) {
                        return DropdownMenuItem(
                          value: to,
                          child: Text(to),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                         tovalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),

              ),
              SizedBox(height: 20,),
///////////////Timepickerrrrrrrrr
              Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(

                        primary: Color(0x33e0e7ff),

                        padding: EdgeInsets.symmetric(horizontal: 140, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,

                            fontWeight: FontWeight.bold)),

                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(context: context,
                          initialDate: date,
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2026)
                      );
                      if (newDate == null) return;
                      setState(() => date = newDate);
                    }, child: Text('${date.day}/${date.month}/${date.year}',style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,


                ))

                ),
              ),
              SizedBox(height: 20,),

              Container(
                width: 357.962890625,
                height: 52.6416015625,
                decoration: new BoxDecoration(
                    color: Color(0x33e0e7ff),
                    borderRadius: BorderRadius.circular(5)
                ),
                child:TextField(
                  decoration: new InputDecoration(labelText: "Enter Time 24h HH:MM"),
                  keyboardType:TextInputType.number,
                  maxLines:1,


                ),
              ),

              SizedBox(height: 30,),


              Container(
                width: 357.962890625,
                height: 52.6416015625,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)
                    ),
                    color: const Color(0x33e0e7ff)
                ),
                child: Text( ('Total price'
                    '               $price' )
                ),
              ),
              SizedBox(height: 30,),

              Container(
                width: 353.119140625,
                height: 49.0263671875,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(5)
                  ),

                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary:  Color(0xff0a0f1d)// Background color
                    ),



                    onPressed: () {

                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => payment()));
                    },
                    child:Text(
                      "Confirm Order",
                      style: const TextStyle(
                          color:  Colors.white,
                          fontFamily: "Roboto",
                          fontSize: 13.0
                      ),

                    )

                ),
              ),


            ],


          ),

        ),


      ),
    );
  }

}



