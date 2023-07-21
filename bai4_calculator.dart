import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
 //  runApp(Center(child: Text("Tong Minh Trieu" , textDirection: TextDirection.rtl,) ,));
   runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        title: "Flutter App Demo",
        theme:ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,),
        home: MyHomePage(key: UniqueKey(), title: "Calculator"));
  }
}

class MyHomePage extends StatefulWidget{
   MyHomePage({required Key key, required this.title}) : super(key: key);

   final String title;
   @override
   _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
   dynamic result = 0.0;
   TextEditingController _textEditingControllerSoA = TextEditingController();
   TextEditingController _textEditingControllerSoB = TextEditingController();
   static const int CONG = 0;
   static const int TRU = 1;
   static const int NHAN = 2;
   static const int CHIA = 3;

   void _calculate(int type) {
      if(_textEditingControllerSoA.text==""){
         showMess("Vui lòng nhập số ");
         return ;
      }
      if(_textEditingControllerSoB.text==""){
         showMess("Vui lòng nhập số ");
         return ;
      }
      // Moi nguoi bat them cac truong hop xay ra nua

      setState(() {

         switch (type) {
            case CONG:
               result = double.parse(_textEditingControllerSoA.text) +  double.parse(_textEditingControllerSoB.text);
               break;
            case TRU:
               result = double.parse(_textEditingControllerSoA.text) -  double.parse(_textEditingControllerSoB.text);
               break;
            case NHAN:
               result = double.parse(_textEditingControllerSoA.text) * double.parse(_textEditingControllerSoB.text);
               break;
            case CHIA:
               result = double.parse(_textEditingControllerSoA.text) / double.parse(_textEditingControllerSoB.text);
               break;
         }
      });
   }

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
         ),
         body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                  Image.network('https://media.wired.com/photos/5c83066025da7204699767c7/16:9/w_2400,h_1350,c_limit/calculator-1470.jpg',width: 150, height: 150,),
                  Container().customContainer(TextField().customTF("Nhập số A",_textEditingControllerSoA)),
                  Container().customContainer(TextField().customTF("Nhập số B",_textEditingControllerSoB)),
                  Container().customContainer(Center(child :Text("Kết quả " + '$result' , textDirection: TextDirection.ltr,style: TextStyle(fontSize: 18.0),))),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                        ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
                        onPressed: () {
                          _calculate(CONG);
                        },
                        child: Text("+", style: TextStyle(color: Colors.white)),
                      ),
                        ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            _calculate(TRU);
                          },
                          child: Text("-", style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            _calculate(NHAN);
                          },
                          child: Text("x", style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.orange),
                          onPressed: () {
                            _calculate(CHIA);
                          },
                          child: Text(":", style: TextStyle(color: Colors.white)),
                        ),
                  ],
                  )
               ],
            ),
         ),
      );
   }

   void showMess(String mess){
      Toast.show(mess, duration: Toast.lengthShort, gravity:  Toast.center);
   }
}

extension ExtTextField on TextField {
   TextField customTF(String title, TextEditingController controllerET) => TextField(
      controller: controllerET,
      decoration: new InputDecoration(
          hintText: title,
          enabledBorder: UnderlineInputBorder(
             borderSide: BorderSide(color: Colors.grey),
             //  when the TextFormField in unfocused
          ) ,
          focusedBorder: UnderlineInputBorder(
             borderSide: BorderSide(color: Colors.blue),
             //  when the TextFormField in focused
          ) ,
          border: UnderlineInputBorder(
          )
      ),
      keyboardType: TextInputType.number,
      obscureText: false,
   );
}

/*extension ExtButton on RaisedButton {
   RaisedButton customRaisedButton(String text , Color color) => RaisedButton(
      onPressed: onPressed,
      disabledColor: color,
      color: color,
      child: Text(text,style: TextStyle(color: Colors.white),),);
}*/



extension ExtContainer on Container{
   Container customContainer(Widget widget) => Container(
       width: 200.0,
       child: widget,
       height: 40.0,
   );
}


