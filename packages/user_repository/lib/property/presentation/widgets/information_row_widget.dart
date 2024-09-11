// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
// import 'package:urgent/core/utils/context_extension.dart';
// import 'package:urgent/core/values/app_colors.dart';
// import 'package:urgent/core/values/app_values.dart';
//
// class InformationRow extends StatelessWidget {
//   const InformationRow({
//     super.key,
//     this.icon,
//     required this.title,
//     required this.value,
//   });
//
//   final String title;
//   final String value;
//   final String? icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: AppValues.padding,
//             vertical: AppValues.halfPadding,
//           ),
//           child: Row(
//             children: [
//               icon == null
//                   ? const SizedBox.shrink()
//                   : SizedBox(
//                       height: 18,
//                       width: 18,
//                       child: SvgPicture.asset(
//                         icon ?? '',
//                         height: 18,
//                       ),
//                     ),
//               icon == null ? const Gap(0) : const Gap(8),
//               Text(
//                 title,
//                 style: context.theme.textTheme.bodyLarge?.copyWith(
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 value,
//                 style: context.theme.textTheme.bodyLarge?.copyWith(
//                   color: AppColors.grey,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const Divider(
//           height: 0,
//           thickness: 0.33,
//           color: Color(0xffC6C6C8),
//         )
//       ],
//     );
//   }
// }
