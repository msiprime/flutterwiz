// import 'package:flutter/material.dart';
// import 'package:urgent/core/utils/context_extension.dart';
// import 'package:urgent/core/values/app_values.dart';
// import 'package:urgent/features/property/presentation/widgets/information_row_widget.dart';
//
// class ValidatedInformationSection extends StatelessWidget {
//   const ValidatedInformationSection({
//     super.key,
//     required this.developer,
//     required this.ownership,
//     required this.usage,
//   });
//
//   final String developer;
//   final String ownership;
//   final String usage;
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
//             'Validated Information',
//             style: context.textTheme.bodyLarge?.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const Divider(
//           height: 0,
//           thickness: 0.33,
//           color: Color(0xffC6C6C8),
//         ),
//         InformationRow(title: 'Developer', value: developer),
//         InformationRow(title: 'Ownership', value: ownership),
//         InformationRow(title: 'Usage', value: usage),
//       ],
//     );
//   }
// }
