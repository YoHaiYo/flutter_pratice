import 'package:flutter/material.dart';

class CheckboxEtcScreen extends StatefulWidget {
  const CheckboxEtcScreen({Key? key}) : super(key: key);

  @override
  State<CheckboxEtcScreen> createState() => _CheckboxEtcScreenState();
}

/// Radio 위젯은 enum(열거형)타입으로 항목을 정의함.
// Radio 항목 정의
enum Gender_1 { MAN, WOMEN }

Gender_1 _gender_1 = Gender_1.MAN; // 화면시작시 초기에 체크되어있을 항목

// RadioListTile 항목 정의
enum Gender_2 { MAN, WOMEN }

Gender_2 _gender_2 = Gender_2.MAN;

class _CheckboxEtcScreenState extends State<CheckboxEtcScreen> {
  // Checkbox 변수정의
  var _isChecked_1 = false;

  // Switch 변수정의
  var _isChecked_2 = false;

  // DropDownButton 항목정의
  final _valueList = ['첫번째', '두번째', '세번째'];
  var _selectedValue = '첫번째';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckboxEtcScreen"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("CheckBox"),
              Checkbox(
                value: _isChecked_1,
                onChanged: (value) {
                  setState(
                        () {
                      _isChecked_1 = value!;
                    },
                  );
                },
              ),

              /// Divider : 구분선위젯
              Divider(height: 20, thickness: 2),

              Text("Switch"),
              Switch(
                value: _isChecked_2,
                onChanged: (value) {
                  setState(
                        () {
                      _isChecked_2 = value;
                    },
                  );
                },
              ),
              Divider(height: 20, thickness: 2),

              Text("Radio : 체크영역만 터치됨."),
              ListTile(
                title: Text("남자"),
                leading: Radio(
                  value: Gender_1.MAN,
                  groupValue: _gender_1,
                  onChanged: (value) {
                    setState(() {
                      _gender_1 = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("여자"),
                leading: Radio(
                  value: Gender_1.WOMEN,
                  groupValue: _gender_1,
                  onChanged: (value) {
                    setState(() {
                      _gender_1 = value!;
                    });
                  },
                ),
              ),
              Divider(height: 20, thickness: 2),

              Text("RadioListTile : 모든영역이 터치됨"),
              RadioListTile(
                title: Text("남자"),
                value: Gender_2.MAN,
                groupValue: _gender_2,
                onChanged: (value) {
                  setState(() {
                    _gender_2 = value!;
                  });
                },
              ),
              RadioListTile(
                title: Text("여자"),
                value: Gender_2.WOMEN,
                groupValue: _gender_2,
                onChanged: (value) {
                  setState(() {
                    _gender_2 = value!;
                  });
                },
              ),
              Divider(height: 20, thickness: 2),

              Text("DropDownButton"),
              DropdownButton(
                value: _selectedValue,
                /// map() 함수로 _valueList 리스트의 문자열 3개를 DropdownMenuItem의 인스턴스로 변경함.
                items: _valueList.map(
                        (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    },
                ).toList(), ///toList : 다시 리스트로 변경
                onChanged: (value){
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
