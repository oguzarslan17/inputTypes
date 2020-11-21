import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StepperSample extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<StepperSample> {
  int _activeStep = 0;
  String _name;
  String _email;
  bool err = false;
  List<Step> _stepler;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _stepler = _steps();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Sample"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}){
            return Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  onPressed: onStepContinue,
                  child: Icon(Icons.arrow_downward)
                ),
                SizedBox(width: 20,),
                RaisedButton(
                    color: Colors.red,
                    onPressed: onStepContinue,
                    child: Icon(Icons.arrow_upward)
                )
              ],
            );
          },
          steps: _stepler,
          type: StepperType.vertical,
          currentStep: _activeStep,
          /*onStepTapped: (picked) {
            setState(() {
              _activeStep = picked;
            });
          },*/
          onStepContinue: () {
            setState(() {
              _forwardController();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_activeStep > 0)
                _activeStep--;
            });
          },
        ),
      ),
    );
  }

  List<Step> _steps() {
    List<Step> steps = [
      Step(
        title: Text("Kullanıcı Adı"),
        subtitle: Text("Kullanıcı Adı Alt Başlık"),
        state: _SetState(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            hintText: "Kullanıcı Adı",
            border: OutlineInputBorder(),
          ),
          validator: (entry) {
            if (entry.length < 6)
              return "En az 6 karakter";
            return null;
          },
          onSaved: (saved) => _name = saved,
        ),
      ),
      Step(
        title: Text("Mail"),
        subtitle: Text("Mail Alt Başlık"),
        state: _SetState(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
            hintText: "Mail",
            border: OutlineInputBorder(),
          ),
          validator: (entry) {
            if (entry.length < 6)
              return "En az 6 karakter";
            return null;
          },
          onSaved: (saved) {
            _email = saved;
          },
        ),
      ),
    ];
    return steps;
  }

  StepState _SetState(int i) {
    if (_activeStep == i) {
      if (err)
        return StepState.error;
      else
        return StepState.editing;
    }
    else
      return StepState.complete;
  }

  void _forwardController() {
    switch(_activeStep){
      case 0:
        if(key0.currentState.validate()) {
          key0.currentState.save();
          err = false;
          _activeStep++;
        }
        else
          err = true;
        break;
      case 1:
        if(key1.currentState.validate()) {
          key1.currentState.save();
          err = false;
          _completed();
        }
        else
          err = true;
        break;
    }
  }

  void _completed() {
    debugPrint("name: $_name, eposta: $_email");
    Navigator.pushNamed(context, "/CPage");
  }
}
