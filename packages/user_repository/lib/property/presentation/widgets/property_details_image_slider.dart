// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:urgent/core/base/widgets/verified_chip.dart';
// import 'package:urgent/features/filter/filter_result/presentation/pages/vehicle_filter_result_page.dart';
//
// class MainImageSlider extends StatelessWidget {
//   const MainImageSlider({
//     super.key,
//     required this.imageUrls,
//     this.isVerified = false,
//   });
//
//   final List<String> imageUrls;
//   final bool isVerified;
//
//   @override
//   Widget build(BuildContext context) {
//     ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
//
//     return ValueListenableBuilder(
//       valueListenable: currentIndex,
//       child: Positioned(
//         top: 0,
//         left: 5,
//         child: isVerified ? const VerifiedChip() : const SizedBox(),
//       ),
//       builder: (context, value, child) => Column(
//         children: [
//           Stack(children: [
//             SizedBox(
//               height: 400,
//               child: Image.network(
//                 imageUrls[value],
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child!
//           ]),
//           const Gap(10),
//           Container(
//             color: Colors.grey[300],
//             child: CarouselSlider(
//               items: carImageUrls.map(
//                 (url) {
//                   int index = imageUrls.indexOf(url);
//                   return Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color:
//                             value == index ? Colors.blue : Colors.transparent,
//                         width: 2,
//                       ),
//                     ),
//                     child: Image.network(
//                       url,
//                       height: 64,
//                       width: 64,
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 },
//               ).toList(),
//               options: CarouselOptions(
//                 enlargeCenterPage: true,
//                 enableInfiniteScroll: false,
//                 height: 64,
//                 viewportFraction: 0.17,
//                 onPageChanged: (index, reason) {
//                   currentIndex.value = index;
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
