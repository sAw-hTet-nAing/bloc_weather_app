import 'package:bloc_weather_app/utils/app_color.dart';
import 'package:bloc_weather_app/utils/dimesions.dart';
import 'package:bloc_weather_app/utils/text_style.dart';
import 'package:flutter/material.dart';

Widget normalInputTextField(
    {required TextEditingController controller,
    required IconData iconData,
    required String hint,
    required bool isPassworField,
    required bool showPass}) {
  return StatefulBuilder(
    builder: (_, setstate) => SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Container(
        //   alignment: Alignment.centerLeft,
        //   child: Text(
        //     title,
        //     style: MyTextStyle.titleText,
        //   ),
        // ),
        // SizedBox(
        //   height: Dimesion.height10,
        // ),
        Container(
          height: Dimesion.height40 * 1.2,
          decoration: BoxDecoration(
              color: AppColor.topGr,
              borderRadius: BorderRadius.circular(Dimesion.radius15 / 2)),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                prefixIcon: Icon(
                  iconData,
                  color: Colors.grey,
                  size: Dimesion.iconSize16,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(Dimesion.radius15 / 2)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(Dimesion.radius15 / 2)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(Dimesion.radius15 / 2)),
                suffixIcon: !isPassworField
                    ? const SizedBox.shrink()
                    : IconButton(
                        onPressed: () {
                          setstate(
                            () => showPass = !showPass,
                          );
                        },
                        icon: Icon(
                          showPass
                              ? Icons.visibility
                              : Icons.visibility_off_rounded,
                          color: Colors.grey,
                          size: Dimesion.iconSize16,
                        ),
                      ),
                label: Text(
                  hint,
                  style: MyTextStyle.labelText,
                )),
            cursorColor: Colors.white,
            obscureText: isPassworField ? showPass : false,
            style: MyTextStyle.normalText,
          ),
        )
      ]),
    ),
  );
}
