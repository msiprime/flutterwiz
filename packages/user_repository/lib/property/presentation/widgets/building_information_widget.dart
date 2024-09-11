// import 'package:flutter/material.dart';
// import 'package:urgent/core/utils/context_extension.dart';
// import 'package:urgent/core/values/app_values.dart';
// import 'package:urgent/features/property/presentation/widgets/information_row_widget.dart';
//
// class BuildingInformationSection extends StatelessWidget {
//   const BuildingInformationSection({
//     super.key,
//     required this.buildingName,
//     required this.floors,
//     required this.retailCenters,
//   });
//
//   final String buildingName;
//   final String floors;
//   final String retailCenters;
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
//             'Building Information',
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
//         InformationRow(title: 'Building Name', value: buildingName),
//         InformationRow(title: 'Floors', value: floors),
//         InformationRow(title: 'Retail Centers', value: retailCenters),
//       ],
//     );
//   }
// }
