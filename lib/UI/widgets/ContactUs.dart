import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key key, this.lang});
  final String lang;
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValueEng = 'Order';
  String dropdownValueTrad = '訂單';
  String dropdownValueSimp = '订单';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.lang == 'eng'
                    ? 'Name'
                    : widget.lang == 'trad'
                        ? '名稱'
                        : '名称'),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextFormField(
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(widget.lang == 'eng'
                    ? 'Mobile'
                    : widget.lang == 'trad'
                        ? '手機號碼'
                        : '手机号码'),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextFormField(
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(widget.lang == 'eng'
                    ? 'Enquiry type'
                    : widget.lang == 'trad'
                        ? '查詢類型'
                        : '查询类型'),
                SizedBox(
                  width: 10,
                ),
                widget.lang == 'eng'
                    ? Flexible(
                        child: DropdownButton<String>(
                        value: dropdownValueEng,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueEng = newValue;
                          });
                        },
                        items: <String>[
                          'Order',
                          'Maintenance',
                          'Service',
                          'Others'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))
                    : widget.lang == 'trad'
                        ? Flexible(
                            child: DropdownButton<String>(
                            value: dropdownValueTrad,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValueTrad = newValue;
                              });
                            },
                            items: <String>['訂單', '維護', '服務', '其他']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ))
                        : Flexible(
                            child: DropdownButton<String>(
                            value: dropdownValueSimp,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValueSimp = newValue;
                              });
                            },
                            items: <String>['订单', '维护', '服务', '其他']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(widget.lang == 'eng'
                    ? 'Content'
                    : widget.lang == 'trad'
                        ? '內容'
                        : '内容'),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter content';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // Process data.
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState.reset();
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
