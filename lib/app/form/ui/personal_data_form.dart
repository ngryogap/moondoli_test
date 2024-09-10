import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mondoli_test/resource/resources.dart';
import 'package:mondoli_test/widget/default_form_view.dart';

import '../form.dart';

class PersonalDataForm extends GetView<FormController> {
  const PersonalDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Data Personal',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormDefault(
                  title: 'Nama Depan',
                  validation:
                      RequiredValidator(errorText: 'Nama Depan Wajib isi').call,
                ),
                FormDefault(
                  title: 'Nama Belakang',
                  validation:
                      RequiredValidator(errorText: 'Nama Belakang Wajib isi')
                          .call,
                ),
                const Text(
                  'Tanggal Lahir',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
                const SizedBox(height: 10),
                DateTimeField(
                  controller: controller.textEditingControllerDate,
                  format: DateFormat("dd-MM-yyyy"),
                  style: const TextStyle(fontSize: 14),
                  decoration: StyleTextFormField.outlineInputBorder().copyWith(
                    contentPadding: const EdgeInsets.all(15),
                    suffixIcon: const Icon(
                      Icons.arrow_drop_down,
                      size: 25,
                    ),
                    border: InputBorder.none,
                    hintText: 'Tanggal Lahir',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                  onFieldSubmitted: (val) {},
                  validator: (date) =>
                      date == null ? 'Tanggal Lahir Wajib isi' : null,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Nomor Telpon',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => PhoneCode(
                          onChanged: (value) =>
                              controller.onChangePhoneCode(value),
                          value: controller.selectedItem.value,
                          bgColor: Colors.transparent,
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: FormDefault(
                        textInputType: TextInputType.number,
                        inputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        validation: RequiredValidator(
                                errorText: 'Nomor Telpon Wajib isi')
                            .call,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Data Alamat',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormDefault(
                  title: 'Negara',
                  hintText: 'Pilih Negara',
                  textController: controller.textEditingControllerCountry,
                  readOnly: true,
                  validation:
                      RequiredValidator(errorText: 'Negara Wajib isi').call,
                  sufixIcon: IconButton(
                    onPressed: () => controller.onClickCountry(),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 25,
                    ),
                  ),
                ),
                FormDefault(
                  title: 'Provinsi',
                  hintText: 'Pilih Provinsi',
                  readOnly: true,
                  textController: controller.textEditingControllerProvince,
                  sufixIcon: IconButton(
                    onPressed: () => controller.onClickProvince(),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 25,
                    ),
                  ),
                ),
                FormDefault(
                  title: 'Kodepos',
                  hintText: 'Pilih Kodepos',
                  readOnly: true,
                  textController: controller.textEditingControllerPosCode,
                  sufixIcon: IconButton(
                    onPressed: () => controller.onClickPosCode(),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 25,
                    ),
                  ),
                ),
                FormDefault(
                  title: 'Alamat',
                  textController: controller.textEditingControllerAddress,
                  maxlines: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
