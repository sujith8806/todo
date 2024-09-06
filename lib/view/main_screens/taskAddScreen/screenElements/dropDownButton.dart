import 'package:flutter/material.dart';
import 'package:todo/database.dart';

Container dropDwonButton(String? dropValue, StateSetter setState) {
  return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: DropdownButton(
                    itemHeight: 50,
                    isExpanded: true,
                    iconSize: 30,
                    iconEnabledColor: Colors.black,
                    iconDisabledColor: Colors.grey,
                    alignment: Alignment.topLeft,
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    enableFeedback: true,
                    focusColor: Colors.red,
                    value: dropValue,
                    hint: Row(
                      children: [
                        Center(
                          child: Text(
                            'Select Catagory',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    items: List.generate(
                      Database.dropDownButtonItemList.length,
                      (index) => DropdownMenuItem(
                        onTap: () {
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            Database.dropDownButtonItemList[index]['icon'],
                            SizedBox(width: 15),
                            Text(
                              Database.dropDownButtonItemList[index]['label'],
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        value: Database.dropDownButtonItemList[index]
                            ['value'],
                      ),
                    ),
                    onChanged: (value) {
                      dropValue = value.toString();
                      setState(() {});
                    },
                  ),
                ),
              );
}
