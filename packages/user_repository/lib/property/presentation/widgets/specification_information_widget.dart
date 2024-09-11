// import 'package:flutter/material.dart';
// import 'package:urgent/core/utils/context_extension.dart';
// import 'package:urgent/core/values/app_assets_path.dart';
// import 'package:urgent/core/values/app_values.dart';
// import 'package:urgent/features/property/presentation/widgets/information_row_widget.dart';
//
// class SpecificationSection extends StatelessWidget {
//   const SpecificationSection({
//     super.key,
//     required this.propertyType,
//     required this.bedrooms,
//     required this.bathrooms,
//     required this.drawingRoom,
//     required this.kitchen,
//     required this.areaSize,
//   });
//
//   final String propertyType;
//   final String bedrooms;
//   final String bathrooms;
//   final String drawingRoom;
//   final String kitchen;
//   final String areaSize;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Divider(
//           height: 0,
//           thickness: 0.33,
//           color: Color(0xffC6C6C8),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: AppValues.padding,
//             vertical: AppValues.halfPadding,
//           ),
//           child: Text(
//             'Specifications',
//             style: context.theme.textTheme.bodyLarge?.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//             // textAlign: TextAlign.center,
//           ),
//         ),
//         const Divider(
//           height: 0,
//           thickness: 0.33,
//           color: Color(0xffC6C6C8),
//         ),
//         InformationRow(
//           title: 'Property Type',
//           value: propertyType,
//           icon: AppAssets.bathroomIcon,
//         ),
//         InformationRow(
//           title: 'Bedrooms',
//           value: bedrooms,
//           icon: AppAssets.bedroomIcon,
//         ),
//         InformationRow(
//           title: 'Bathrooms',
//           value: bathrooms,
//           icon: AppAssets.bathroomIcon,
//         ),
//         InformationRow(
//           title: 'Drawing Room',
//           value: drawingRoom,
//           icon: AppAssets.bathroomIcon,
//         ),
//         InformationRow(
//           title: 'Kitchen',
//           value: kitchen,
//           icon: AppAssets.bathroomIcon,
//         ),
//         InformationRow(
//           title: 'Area Size',
//           value: areaSize,
//           icon: AppAssets.areaSizeIcon,
//         ),
//       ],
//     );
//   }
// }
