
// import 'package:bloc_weather_app/widgets/rectangle_cart.dart';
// import 'package:flutter/material.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';


// class Poster extends StatelessWidget {
//   static const POSTER_RATIO = 0.7;

//   Poster(this.posterUrl, {required this.height, required this.status});

//   final String posterUrl;
//   final double height;

//   final String status;

//   @override
//   Widget build(BuildContext context) {
//     var width = POSTER_RATIO * height;

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(Dimesion.radius15 / 2),
//       child: Stack(
//         children: [
//           RectangleCard(
//             color: Colors.black,
//             width: 0.0,
//             widget: CachedNetworkImage(
//                 imageUrl: posterUrl,
//                 height: height,
//                 width: width,
//                 placeholder: (context, url) => Center(
//                         child: LoadingAnimationWidget.inkDrop(
//                       color: AppColor.primary,
//                       size: Dimesion.radius15 * 0.85,
//                     )),
//                 errorWidget: (context, url, error) =>
//                     Image.asset('assets/noimg.png'),
//                 imageBuilder: (context, img) {
//                   return Container(
//                     foregroundDecoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                         colors: [
//                           Colors.black,
//                           Colors.black.withOpacity(0.5),
//                           Colors.black.withOpacity(0.2),
//                           Colors.black.withOpacity(0),
//                           Colors.black.withOpacity(0),
//                           Colors.black.withOpacity(0),
//                         ],
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.circular(Dimesion.radius15 / 2),
//                         image: DecorationImage(image: img, fit: BoxFit.cover)),
//                   );
//                 }),
//           ),
//           if (status != "0")
//             Positioned(
//               top: 0,
//               left: 0,
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: Dimesion.width5, vertical: Dimesion.width5 / 2),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(Dimesion.radius15 / 2)),
//                   color: AppColor.widgetGreen,
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   "New",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.normal),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
