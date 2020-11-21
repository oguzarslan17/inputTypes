import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ASayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A SAYFASI",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("B Sayfası."),
                color: Colors.teal,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BSayfasi()),
                  ).then((value) => debugPrint("$value"));
                },
              ),
              RaisedButton(
                child: Text("C Sayfası."),
                color: Colors.teal,
                onPressed: () {
                  Navigator.pushNamed(context, "/CPage");
                },
              ),
              RaisedButton(
                child: Text("D Sayfası."),
                color: Colors.teal,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DSayfasi()));
                },
              ),
              RaisedButton(
                child: Text("E Sayfası."),
                color: Colors.teal,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ESayfasi()),
                  ).then((value) => debugPrint("$value"));
                },
              ),
              RaisedButton(
                child: Text("F Sayfası. Generate Route"),
                color: Colors.teal,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "FPage",
                  ).then((value) => debugPrint("$value"));
                },
              ),
              RaisedButton(
                child: Text("Form Islemleri."),
                color: Colors.teal,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormIslemleri()),
                  ).then((value) => debugPrint("$value"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BSayfasi extends StatelessWidget {
  String pageContent = "C SAYFASI";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "B SAYFASI",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Geri Dön."),
              color: Colors.cyan,
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CSayfasi extends StatelessWidget {
  String baslik;

  CSayfasi(String a) {
    baslik = a;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        debugPrint("On will pop çalıştı");
        Navigator.pop(context, "C SAYFASINDAN GÖNDERİLEN VERİ");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            baslik,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Geri Dön."),
                color: Colors.cyan,
                onPressed: () {
                  Navigator.pop(context, "C SAYFASINDAN GERİ DÖNÜLDÜ");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "D SAYFASI",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("B Sayfası."),
              color: Colors.teal,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BSayfasi()),
                ).then((value) => debugPrint("$value"));
              },
            ),
            RaisedButton(
              child: Text("C Sayfası."),
              color: Colors.teal,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CSayfasi("C SAYFASI")),
                ).then((value) => debugPrint("$value"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ESayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E SAYFASI",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("B Sayfası."),
              color: Colors.teal,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BSayfasi()),
                ).then((value) => debugPrint("$value"));
              },
            ),
            RaisedButton(
              child: Text("C Sayfası."),
              color: Colors.teal,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CSayfasi("C SAYFASI")),
                ).then((value) => debugPrint("$value"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "F SAYFASI",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Liste Elemani $index",
                  style: TextStyle(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/detay/$index");
            },
          );
        },
        itemCount: 40,
      ),
    );
  }
}

class ListeDetay extends StatelessWidget {
  int index;

  ListeDetay(int index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste Detay Sayfası ",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(40),
          padding: EdgeInsets.all(20),
          color: Colors.teal,
          child: Text("$index. elemanın detay sayfası"),
        ),
      ),
    );
  }
}

class FormIslemleri extends StatefulWidget {
  @override
  _FormIslemleriState createState() => _FormIslemleriState();
}

class _FormIslemleriState extends State<FormIslemleri> {
  String inputS = "";
  FocusNode _fNode;
  int maxLine = 1;
  TextEditingController textController1;

  @override
  void initState() {
    super.initState();
    _fNode = FocusNode();
    textController1 = TextEditingController(text: "varsayılan");
    _fNode.addListener(() {
      setState(() {
        if(_fNode.hasFocus){
          maxLine = 5;
        }else{
          maxLine = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _fNode.dispose();
    textController1.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Input Islemleri"),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            child: FloatingActionButton(
              child: Icon(Icons.edit, size: 15,),
              onPressed: (){
                debugPrint(textController1.text);
                //FocusScope.of(context).requestFocus(_fNode);
              },
              backgroundColor: Colors.red,
            ),
          ),
          SizedBox(height: 10.0,),
          FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: (){
              textController1.text = "Butona tıklanınca gelen değer";
            },
            backgroundColor: Colors.pink,
            mini: true,
          ),
          SizedBox(height: 10.0,),
          FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: (){
              FocusScope.of(context).requestFocus(_fNode);
            },
          )
        ],
      ),

      body: ListView(
        children: <Widget>[

          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              textInputAction: TextInputAction.done,
              //textAlign: TextAlign.center,
              autofocus: true,
              maxLines: maxLine,
              maxLength: 100,
              controller: textController1,
              focusNode: _fNode,
              decoration: InputDecoration(
                hintText: "Kullanıcı Adı",
                //labelText: "Şifre",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                icon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.add),
                suffixIcon: Icon(Icons.remove),
                fillColor: Colors.teal,
                filled: true,
              ),
              maxLengthEnforced: true,
              onChanged: (s) => debugPrint("On change: $s"),
              onSubmitted: (s) {
                inputS = s;
              },
              cursorColor: Colors.pink,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              //textAlign: TextAlign.center,
              maxLines: 1,
              maxLength: 6,
              decoration: InputDecoration(
                hintText: "Şifre",
                //labelText: "Şifre",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                icon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.add),
                suffixIcon: Icon(Icons.remove),
                fillColor: Colors.teal,
                filled: true,
              ),
              maxLengthEnforced: true,
              onChanged: (s) => debugPrint("On change: $s"),
              onSubmitted: (s) {
                inputS = s;
              },
              cursorColor: Colors.pink,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.height,
            height: MediaQuery.of(context).size.height,
            color: Colors.teal,
            child: Align(
              alignment: Alignment.center,
              child: Text(inputS),
            ),
          ),
        ],
      ),
    );
  }
}
