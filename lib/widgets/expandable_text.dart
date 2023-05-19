// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wisdom_tree_oneone_libiary/utils/app_color.dart';
// import 'package:wisdom_tree_oneone_libiary/utils/text_style.dart';

// class ExpandableText extends StatefulWidget {
//   final String text;

//   ExpandableText({Key? key, required this.text}) : super(key: key);

//   @override
//   State<ExpandableText> createState() => _ExpandableTextState();
// }

// class _ExpandableTextState extends State<ExpandableText> {
//   String? firstHalf;
//   String? secHalf;

//   bool hiddenText = true;

//   double textHeight = Get.context!.height / 3.9;
//   @override
//   void initState() {
//     super.initState();
//     if (widget.text.length > 120) {
//       firstHalf = widget.text.substring(0, 120);
//       secHalf = widget.text.substring(120, widget.text.length);
//     } else {
//       firstHalf = widget.text;
//       secHalf = "";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: secHalf!.isEmpty
//             ? Text(
//                 firstHalf!,
//                 style: MyTextStyle.smallTextGrey,
//               )
//             : Column(
//                 children: [
//                   Text(
//                     hiddenText ? (firstHalf! + "...") : (firstHalf! + secHalf!),
//                     style: MyTextStyle.smallTextGrey,
//                   ),
//                   InkWell(
//                     onTap: (() {
//                       setState(() {
//                         hiddenText = !hiddenText;
//                       });
//                     }),
//                     child: Row(
//                       children: [
//                         Text(
//                           hiddenText ? "Show more" : "Show less",
//                           style: MyTextStyle.smallText
//                               .copyWith(color: AppColor.activeGreen),
//                         ),
//                         Icon(
//                           hiddenText
//                               ? Icons.arrow_drop_down
//                               : Icons.arrow_drop_up,
//                           color: AppColor.activeGreen,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ));
//   }
// }
