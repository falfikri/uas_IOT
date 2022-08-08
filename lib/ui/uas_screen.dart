import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';

class UasScreen extends StatefulWidget{
  const UasScreen({Key? key}) : super(key: key);
  @override
    uasScreenstate createState()=>
      uasScreenstate();
}

class uasScreenstate extends State<UasScreen>{
  final TextEditingController? controllerlampumerah = TextEditingController();
  final TextEditingController? controllerlampukuning = TextEditingController();
  final TextEditingController? controllerlampuhijau= TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference iot = FirebaseFirestore.instance.collection('iot');

  @override
  void initState(){
    super.initState();
  }

  Future<void> updateFirestore(String perintah1, String perintah2, String perintah3) {
    print("send perintah");
    return iot.doc('perintah').update({'lampu_merah': perintah1, 'lampu_kuning': perintah2, 'lampu_hijau': perintah3}).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Berhasil")));
    }).catchError((error) {
      print("$error");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update firestore")));
    });
  }

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "UAS 1220428",
          style: TextStyle(color: Colors.white)
        ),
        
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 10,
            ),
            /* controller lampu merah */
            Container(
              child: TextFormField(
                cursorColor: Colors.red,
                controller: controllerlampumerah,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.light_mode,
                    color: Colors.red,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "on/off",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                  labelText: 'Lampu Merah',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                ),
              ),
            ),

            Container(
              height: 15,
            ),

            /* controller lampu kuning */
            Container(
              child: TextFormField(
                cursorColor: Colors.orange,
                controller: controllerlampukuning,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.light_mode,
                    color: Colors.orange,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(color: Colors.orange, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "on/off",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                  labelText: 'Lampu kuning',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                ),
              ),
            ),

            Container(
              height: 15,
            ),

            /* cotroller lampu hijau */
            Container(
              child: TextFormField(
                cursorColor: Colors.green,
                controller: controllerlampuhijau,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.light_mode,
                    color: Colors.green,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "on/off",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                  labelText: 'Lampu hijau',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                ),
              ),
            ),

            Container(
                height: 30,
            ),

            GFButton(
              onPressed: () async{
                String? perintah1 = controllerlampumerah!.text.toString();
                String? perintah2 = controllerlampukuning!.text.toString();
                String? perintah3 = controllerlampuhijau!.text.toString();
                updateFirestore(perintah1, perintah2, perintah3);
              },
              text: "Kirim",
              shape: GFButtonShape.pills,
              fullWidthButton: true,
              color: Colors.green,
            ),

            Container(
              height: 15,
            ),

            GFButton(
              onPressed: () async{
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);
              },
              text: "Cek Suhu Ruangan",
              shape: GFButtonShape.pills,
              fullWidthButton: true,
            ),
          ],
        ),
      ),
    );
  }
}