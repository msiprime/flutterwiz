// import 'package:flutter/material.dart';
// import 'package:urgent/core/utils/context_extension.dart';
// import 'package:urgent/core/values/app_values.dart';
// import 'package:urgent/features/property/presentation/widgets/information_row_widget.dart';
//
// class MoreInformationOfPosterSection extends StatelessWidget {
//   const MoreInformationOfPosterSection({
//     super.key,
//     required this.permitNumber,
//     required this.reraNumber,
//     required this.dedNumber,
//     required this.referenceNumber,
//   });
//
//   final String permitNumber;
//   final String reraNumber;
//   final String dedNumber;
//   final String referenceNumber;
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
//             'More Information',
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
//         InformationRow(title: 'Permit Number', value: permitNumber),
//         InformationRow(title: 'RERA', value: reraNumber),
//         InformationRow(title: 'DED', value: dedNumber),
//         InformationRow(title: 'Reference ID', value: referenceNumber),
//       ],
//     );
//   }
// }
