// ignore_for_file: file_names, non_constant_identifier_names
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/API/Api.dart';
import '../../Services/Functions/Variables.dart';
import '../Elements.dart';
import '../../../Services/Thems/Theme.dart';
import 'package:http/http.dart' as http;

//Class  --------------- ^^^^^^^^^^^^^^^
class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}
//Class  --------------- ^^^^^^^^^^^^^^^

//UI Class  --------------- ^^^^^^^^^^^^^^^
class _LoginPageState extends State<Request> {
//TextEditingController  --------------- ^^^^^^^^^^^^^^^
  late String _type = '';
  List<bool> isSelected = [true, false, false, false];
  final TextEditingController _classes = TextEditingController();
  final TextEditingController _qussam = TextEditingController();
  final TextEditingController _details = TextEditingController();
  final List<Map<String, dynamic>> _Classroom = [
    {
      'value': 'Class One Primary'.tr,
      'label': 'Class One Primary'.tr,
    },
    {
      'value': 'Class Tow Primary'.tr,
      'label': 'Class Tow Primary'.tr,
    },
    {
      'value': 'Class Three Primary'.tr,
      'label': 'Class Three Primary'.tr,
    },
    {
      'value': 'Class Four Primary'.tr,
      'label': 'Class Four Primary'.tr,
    },
    {
      'value': 'Class Five Primary'.tr,
      'label': 'Class Five Primary'.tr,
    },
    {
      'value': 'Class Six Primary'.tr,
      'label': 'Class Six Primary'.tr,
    },
    {
      'value': 'Class One Middle'.tr,
      'label': 'Class One Middle'.tr,
    },
    {
      'value': 'Class Tow Middle'.tr,
      'label': 'Class Tow Middle'.tr,
    },
    {
      'value': 'Class Three Middle'.tr,
      'label': 'Class Three Middle'.tr,
    },
    {
      'value': 'Class Four Scintific'.tr,
      'label': 'Class Four Scintific'.tr,
    },
    {
      'value': 'Class Four Literary'.tr,
      'label': 'Class Four Literary'.tr,
    },
    {
      'value': 'Class Five Literary'.tr,
      'label': 'Class Five Literary'.tr,
    },
    {
      'value': 'Class Five Biology'.tr,
      'label': 'Class Five Biology'.tr,
    },
    {
      'value': 'Class Five Applied'.tr,
      'label': 'Class Five Applied'.tr,
    },
    {
      'value': 'Class Six Applied'.tr,
      'label': 'Class Six Applied'.tr,
    },
    {
      'value': 'Class Six Commercial'.tr,
      'label': 'Class Six Commercial'.tr,
    },
    {
      'value': 'Class Six Literary'.tr,
      'label': 'Class Six Literary'.tr,
    },
    {
      'value': 'Class Six Biology'.tr,
      'label': 'Class Six Biology'.tr,
    },
  ];
  final List<Map<String, dynamic>> _subjects = [
    {'value': 'The Arabic'.tr, 'label': 'The Arabic'.tr},
    {'value': 'Mathematics'.tr, 'label': 'Mathematics'.tr},
    {'value': 'The English'.tr, 'label': 'The English'.tr},
    {'value': 'Biology'.tr, 'label': 'Biology'.tr},
    {'value': 'Geography'.tr, 'label': 'Geography'.tr},
    {'value': 'Science'.tr, 'label': 'Science'.tr},
    {'value': 'Chemistry'.tr, 'label': 'Chemistry'.tr},
    {'value': 'Physics'.tr, 'label': 'Physics'.tr},
    {'value': 'Technology'.tr, 'label': 'Technology'.tr},
    {'value': 'History'.tr, 'label': 'History'.tr},
    {'value': 'Economics'.tr, 'label': 'Economics'.tr},
    {'value': 'French'.tr, 'label': 'French'.tr},
    {'value': 'Kurdish'.tr, 'label': 'Kurdish'.tr},
    {'value': 'Islamic'.tr, 'label': 'Islamic'.tr},
    {'value': 'Sociology'.tr, 'label': 'Sociology'.tr},
    {'value': 'Philosophy'.tr, 'label': 'Philosophy'.tr},
  ];
  final String _Classroom_value = 'Class One Primary'.tr;
  final String _subjects_Value = 'The Arabic'.tr;
//TextEditingController  --------------- ^^^^^^^^^^^^^^^

//Content  --------------- ^^^^^^^^^^^^^^^
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
//space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 20),
//space --------------- ^^^^^^^^^^^^^^^

//TitlePage --------------- ^^^^^^^^^^^^^^^
          Center(
            child: TitlePages(
              name: 'Add Request'.tr,
              font: 'Cairo-Bold',
            ),
          ),
//TitlePage --------------- ^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 10),
//space --------------- ^^^^^^^^^^^^^^^

//SelectFormField Group --------------- ^^^^^^^^^^^^^^^
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//SelectFormField Group --------------- ^^^^^^^^^^^^^^^
              Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
//space --------------- ^^^^^^^^^^^^^^^
                      const SizedBox(height: 20),
//space --------------- ^^^^^^^^^^^^^^^

//_Classroom --------------- ^^^^^^^^^^^^^^^
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: const Color.fromRGBO(189, 189, 189, 1),
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: SelectFormField(
                          type: SelectFormFieldType.dropdown,
                          items: _Classroom,
                          initialValue: _Classroom_value,
                          onChanged: (val) =>
                              setState(() => {_classes.text = val}),
                          onSaved: (val) =>
                              setState(() => {_classes.text = val!}),
                        ),
                      ),
//_Classroom --------------- ^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
                      const SizedBox(height: 20),
//space --------------- ^^^^^^^^^^^^^^^

//_subjects --------------- ^^^^^^^^^^^^^^^
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: const Color.fromRGBO(189, 189, 189, 1),
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: SelectFormField(
                          type: SelectFormFieldType.dropdown,
                          items: _subjects,
                          initialValue: _subjects_Value,
                          onChanged: (val) =>
                              setState(() => {_qussam.text = val}),
                          onSaved: (val) =>
                              setState(() => {_qussam.text = val!}),
                        ),
                      ),
//_subjects --------------- ^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
                      const SizedBox(height: 10),
//space --------------- ^^^^^^^^^^^^^^^

//Select Type _subjects --------------- ^^^^^^^^^^^^^^^
                      Align(
                        child: TitlePages(
                          name: 'Choose the type of content'.tr,
                          font: 'Cairo-Bold',
                        ),
                        alignment: LangSet
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                      ),
//Select Type _subjects --------------- ^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
                      const SizedBox(
                        height: 20,
                      ),
//space --------------- ^^^^^^^^^^^^^^^

//Select Type _subjects ToggleButtons --------------- ^^^^^^^^^^^^^^^
                      ToggleButtons(
                        tapTargetSize: MaterialTapTargetSize.padded,
                        color: Theme.of(context).colorScheme.secondary,
                        selectedColor: Colors.white,
                        fillColor: color_system,
                        hoverColor: const Color(0xFF6200EE).withOpacity(0.04),
                        borderRadius: BorderRadius.circular(4.0),
                        constraints:
                            const BoxConstraints(minHeight: 36.0, minWidth: 80),
                        isSelected: isSelected,
                        onPressed: (index) {
                          var h1 = [true, false, false, false];
                          var h2 = [false, true, false, false];
                          var h3 = [false, false, true, false];
                          var h4 = [false, false, false, true];
                          var ko = [h1, h2, h3, h4];
                          var text = ['ملزمة', 'كتاب', 'فيديو', 'اعلان'];
                          setState(() {
                            isSelected = ko[index];
                            _type = text[index];
                          });
                        },
                        children: [
                          Text(
                            'Binding'.tr,
                            style: const TextStyle(fontFamily: 'CairoSemiBold'),
                          ),
                          Text('Book'.tr,
                              style:
                                  const TextStyle(fontFamily: 'CairoSemiBold')),
                          Text(
                            'Video'.tr,
                            style: const TextStyle(fontFamily: 'CairoSemiBold'),
                          ),
                          Text(
                            'Advertising'.tr,
                            style: const TextStyle(fontFamily: 'CairoSemiBold'),
                          )
                        ],
                      ),
//Select Type _subjects ToggleButtons --------------- ^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
                      const SizedBox(height: 20),
//space --------------- ^^^^^^^^^^^^^^^

//TextFormField _details --------------- ^^^^^^^^^^^^^^^
                      TextFormField(
                        textDirection: TextDirection.rtl,
                        keyboardType: TextInputType.multiline,
                        controller: _details,
                        decoration: InputDecoration(
                          labelText: 'Details'.tr,
                          border: const OutlineInputBorder(),
                        ),
                      )
//TextFormField _details --------------- ^^^^^^^^^^^^^^^

                      ,
                    ],
                  )),

//Button Send Request ^^^^^^^^^^^^^^^^^^^^^^^^^^
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(61, 147, 221, 1),
                              Color.fromARGB(255, 122, 192, 249)
                            ]),
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    padding: const EdgeInsets.only(left: 10, right: 10),
// ignore: deprecated_member_use
                    child: FlatButton(
                      minWidth: double.infinity,
                      textColor: Colors.white,
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        if (_details.text != '') {
                          if (prefs.getString('StateUserLogin') == '1') {
                            var url = Uri.parse(
                                api_website + 'ServerApi/addFromUser.php');
                            var response = await http.post(url, body: {
                              'userid': prefs.getString('IDUser'),
                              'classes': _classes.text,
                              'qussam': _qussam.text,
                              'details': _details.text,
                              'type': _type,
                            });
                            // print('Response status: ${response.statusCode}');

                            if (response.statusCode == 200) {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Thank You!".tr,
                                      textAlign: TextAlign.center,
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                            'Your_suggestion'.tr,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('close'.tr),
                                        onPressed: () {
                                          setState(() {
                                            _details.text = '';
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'You_are_not_registered'.tr,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                          'Please_log_in_to_the_application'.tr,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('close'.tr),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } else {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Oops!".tr,
                                  textAlign: TextAlign.center,
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                        'The_information_must'.tr,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('close'.tr),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Send Request'.tr,
                        style: const TextStyle(fontSize: 21),
                      ),
                    )),
              ),
//Button Send Request ^^^^^^^^^^^^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
              const SizedBox(height: 30),
//space --------------- ^^^^^^^^^^^^^^^
            ],
          ),
        ],
      ),
    );
  }
}
