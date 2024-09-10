import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../form.dart';

class BottomSheetSelectCountryView extends StatelessWidget {
  final List<CountriesModel>? items;
  final Function? onClick;
  const BottomSheetSelectCountryView({
    super.key,
    this.items,
    this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 30,
              decoration: BoxDecoration(
                  color: const Color(0xFF000F42),
                  border: Border.all(
                    color: const Color(0xFF000F42),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: items!.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () => onClick!(items![index]),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        items![index].name!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'HelveticaNeue',
                        ),
                      )),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 1,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
