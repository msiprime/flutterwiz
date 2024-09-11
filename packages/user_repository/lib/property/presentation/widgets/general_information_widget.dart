// import 'package:flutter/material.dart';
// import 'package:urgent/core/utils/context_extension.dart';
// import 'package:urgent/core/values/app_values.dart';
// import 'package:urgent/features/property/presentation/widgets/information_row_widget.dart';
//
// class GeneralInformationSection extends StatelessWidget {
//   const GeneralInformationSection({
//     super.key,
//     required this.purpose,
//     required this.propertyAge,
//     required this.updated,
//     required this.completionStatus,
//     required this.serviceCharge,
//   });
//
//   final String purpose;
//   final String propertyAge;
//   final String updated;
//   final String completionStatus;
//   final String serviceCharge;
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
//             'General Information',
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
//         InformationRow(title: 'Purpose', value: purpose),
//         InformationRow(title: 'Property Age', value: propertyAge),
//         InformationRow(title: 'Updated ', value: updated),
//         InformationRow(title: 'Completion Status', value: completionStatus),
//         InformationRow(title: 'Service Charge', value: serviceCharge),
//       ],
//     );
//   }
// }
