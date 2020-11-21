import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormInput extends StatefulWidget {
  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  String _name;
  String _email;
  String _phone1;
  String _phone2;
  String _pWord;
  bool _automaticSave = false;
  bool _checkBoxState = false;
  String cities = "";
  bool switchTile1 = false;
  bool switchTile2 = true;
  double SliderValue = 0;
  String _dropDownPicked;
  String pickedCity = "Ankara";
  DateTime date = DateTime.now();
  DateTime date2 = DateTime(2020, 1, 1);
  DateTime date3 = DateTime(2030, 1, 1);
  TimeOfDay tod = TimeOfDay.now();
  List<String> cities2 = ["İstanbul", "Sivas", "Ankara"];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColor: Colors.teal,
          brightness: Brightness.light,
          hintColor: Colors.blueGrey,
          errorColor: Colors.deepPurpleAccent,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Form Input Sayfası"),
          centerTitle: true,
        ),
        /*floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurple,
          onPressed: () {},
        ),*/
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            autovalidate: _automaticSave,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.account_box,
                    ),
                    hintText: "Adınız ve Soyadınız",
                  ),
                  validator: (String entry) {
                    if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]')
                        .hasMatch(entry))
                      return "Gerekli Alan";
                    else
                      return null;
                  },
                  onSaved: (entry) => _name = entry,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                    ),
                    hintText: "Eposta Adresiniz",
                  ),
                  validator: _emailControl,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (entry) => _email = entry,
                ),
                /*Container(
                  child: InternationalPhoneInput(
                      decoration: InputDecoration.collapsed(hintText: 'Cep Telefonu'),
                      onPhoneNumberChange: onPhoneNumberChange,
                      initialPhoneNumber: phoneNumber,
                      initialSelection: phoneIsoCode,
                      enabledCountries: ['+90'],
                      showCountryCodes: true
                  ),
                ),*/
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone_android,
                    ),
                    hintText: "Cep Telefonu",
                  ),
                  validator: (String entry) =>
                      entry.length == 0 ? "Gerekli Alan" : null,
                  keyboardType: TextInputType.phone,
                  onSaved: (entry) => _phone1 = entry,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                    ),
                    hintText: "Sabit Telefon Numarası",
                  ),
                  validator: (String entry) =>
                      entry.length == 0 ? "Gerekli Alan" : null,
                  keyboardType: TextInputType.phone,
                  onSaved: (entry) => _phone2 = entry,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                    ),
                    hintText: "Şifre",
                  ),
                  onSaved: (entry) => _pWord = entry,
                  validator: (String entry) =>
                      entry.length == 0 ? "Gerekli Alan" : null,
                ),
                RaisedButton.icon(
                  onPressed: _validate,
                  icon: Icon(Icons.save),
                  color: Colors.blueGrey,
                  label: Text("Save"),
                ),
                CheckboxListTile(
                  value: _checkBoxState,
                  onChanged: (picked) {
                    setState(() {
                      _checkBoxState = picked;
                    });
                  },
                  activeColor: Colors.orange,
                  title: Text("CheckBox Title"),
                  subtitle: Text("CheckBox Sub Title"),
                  secondary: Icon(Icons.map),
                ),
                RadioListTile<String>(
                  value: "Ankara",
                  groupValue: cities,
                  onChanged: (entry) {
                    setState(() {
                      cities = entry;
                      debugPrint("Değer: $entry");
                    });
                  },
                  title: Text("Ankara"),
                  subtitle: Text("Boş"),
                ),
                RadioListTile<String>(
                  value: "Sivas",
                  groupValue: cities,
                  onChanged: (entry) {
                    setState(() {
                      cities = entry;
                      debugPrint("Değer: $entry");
                    });
                  },
                  title: Text("Sivas"),
                  subtitle: Text("City of Angels"),
                ),
                RadioListTile<String>(
                  value: "İstanbul",
                  groupValue: cities,
                  onChanged: (entry) {
                    setState(() {
                      cities = entry;
                      debugPrint("Değer: $entry");
                    });
                  },
                  title: Text("İstanbul"),
                  subtitle: Text("Boş"),
                  secondary: Icon(Icons.location_city),
                ),
                SwitchListTile(
                  value: switchTile1,
                  onChanged: (entry) {
                    setState(() {
                      switchTile1 = entry;
                    });
                  },
                  title: Text("Basic False Switch"),
                ),
                SwitchListTile(
                  value: switchTile2,
                  onChanged: (entry) {
                    setState(
                      () {
                        switchTile2 = entry;
                      },
                    );
                  },
                  title: Text("Basic True Switch"),
                ),
                Slider(
                  value: SliderValue,
                  onChanged: (entry) {
                    setState(() {
                      SliderValue = entry;
                    });
                  },
                  max: 100,
                  min: 0,
                  divisions: 100,
                  label: SliderValue.toString(),
                  activeColor: Colors.teal,
                  inactiveColor: Colors.blueGrey,
                ),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      child: Text("Kırmızı"),
                      value: "Kirmizi",
                    ),
                    DropdownMenuItem<String>(
                      child: Text("Mavi"),
                      value: "Mavi",
                    ),
                    DropdownMenuItem<String>(
                      child: Text("Yeşil"),
                      value: "Yesil",
                    ),
                  ],
                  onChanged: (picked) {
                    setState(() {
                      _dropDownPicked = picked;
                    });
                  },
                  hint: Text("Pick One"),
                  value: _dropDownPicked,
                ),
                DropdownButton<String>(
                  items: cities2.map((e) {
                    return DropdownMenuItem<String>(
                      child: Text(e.toString()),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (s) {
                    setState(() {
                      pickedCity = s;
                    });
                  },
                  value: pickedCity,
                  hint: Text("Şehir"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Tarih Seç"),
                      color: Colors.green,
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: date2,
                                lastDate: date3)
                            .then((picked) {
                          debugPrint(picked.toIso8601String());
                          debugPrint(picked.toUtc().toIso8601String());
                        });
                      },
                    ),
                    RaisedButton(
                      child: Text("Saat Seç"),
                      color: Colors.blue,
                      onPressed: () {
                        showTimePicker(
                          helpText: "Saat Seç",
                          context: context,
                          initialTime: tod,
                        ).then((value) => debugPrint(value.toString()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validate() {
    if (!formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint(
          "Ad Soyad: $_name Eposta: $_email Cep Telefonu: $_phone1 Sabit Telefon $_phone2 Şifre: $_pWord");
    } else {
      setState(() {
        _automaticSave = true;
      });
    }
  }

  String _emailControl(String entry) {
    if (!EmailValidator.validate(entry)) return "Gerekli Alan";
    return null;
  }
}
