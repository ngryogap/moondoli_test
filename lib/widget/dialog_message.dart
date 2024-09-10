import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondoli_test/widget/button_view.dart';

class DialogMessage {
  final String? title;
  final double titleFontSize;
  final String message;
  final Widget? image;
  final String textConfirm;
  final String textCancel;
  final Function onConfirm;
  final Function? onCancel;
  final bool dissmisable;

  const DialogMessage(
      {this.title,
      this.titleFontSize = 14,
      required this.message,
      this.image,
      this.textConfirm = "Selesai",
      this.textCancel = "Batal",
      required this.onConfirm,
      this.onCancel,
      this.dissmisable = true});

  show() {
    Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      radius: 0,
      content: _Content(
        title: title,
        titleFontSize: titleFontSize,
        message: message,
        image: image,
        textConfirm: textConfirm,
        textCancel: textCancel,
        onConfirm: onConfirm,
        onCancel: onCancel,
        dissmisable: dissmisable,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String? title;
  final double titleFontSize;
  final String message;
  final Widget? image;
  final String textConfirm;
  final String textCancel;
  final Function onConfirm;
  final Function? onCancel;
  final bool dissmisable;

  const _Content(
      {super.key,
      this.title,
      this.titleFontSize = 20,
      required this.message,
      this.image,
      this.textConfirm = "OK",
      this.textCancel = "Batal",
      required this.onConfirm,
      this.onCancel,
      this.dissmisable = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dissmisable ? Get.back() : null,
      child: WillPopScope(
        onWillPop: () => Future.value(dissmisable),
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xE6FFFFFF),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (image != null) image!,
                  if (image != null)
                    const SizedBox(
                      height: 20,
                    ),
                  if (title != null)
                    Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: titleFontSize,
                          fontFamily: "HelveticaNeue",
                          fontWeight: FontWeight.w700),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: "HelveticaNeue"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 45,
                    width: Get.width,
                    child: Row(
                      children: [
                        if (onCancel != null)
                          Expanded(
                            child: ButtonRounded(
                              onClick: () => onCancel!(),
                              text: textCancel,
                              textSize: 12,
                              fontFamily: "HelveticaNeue",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        if (onCancel != null) const SizedBox(width: 20),
                        Expanded(
                          child: ButtonRounded(
                            onClick: () => onConfirm(),
                            text: textConfirm,
                            textSize: 12,
                            fontFamily: "HelveticaNeue",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
