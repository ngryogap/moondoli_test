// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mondoli_test/resource/resources.dart';

class PhoneCode extends StatelessWidget {
  final Function onChanged;
  final dynamic value;
  final Color? bgColor;

  var items = [
    '+62',
    '+63',
    '+64',
  ];

  PhoneCode({
    super.key,
    required this.onChanged,
    required this.value,
    this.bgColor,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                alignment: AlignmentDirectional.centerStart,
                isExpanded: true,
                hint: const Text(
                  '+62',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
                items: items
                    .map<DropdownMenuItem<String>>((String value) =>
                        DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'HelveticaNeue',
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                value: value,
                onChanged: (value) => onChanged(value),
                iconStyleData: const IconStyleData(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ),
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.primaryGreyColor,
                    ),
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
