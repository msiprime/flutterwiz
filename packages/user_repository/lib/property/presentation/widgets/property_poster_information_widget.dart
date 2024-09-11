// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:urgent/core/base/widgets/make_phone_call.dart';
// import 'package:urgent/core/base/widgets/make_whatsapp_call.dart';
// import 'package:urgent/core/utils/context_extension.dart';
// import 'package:urgent/core/values/app_colors.dart';
// import 'package:urgent/core/values/app_values.dart';
// import 'package:urgent/features/property/presentation/widgets/more_info_of_poster_widget.dart';
//
// class PropertyPosterInformationSection extends StatelessWidget {
//   const PropertyPosterInformationSection({
//     super.key,
//     required this.permitNumber,
//     required this.reraNumber,
//     required this.dedNumber,
//     required this.referenceNumber,
//     required this.phoneNumber,
//     required this.whatsappNumber,
//     required this.posterName,
//     required this.posterAvatar,
//     required this.devCompany,
//   });
//
//   final String permitNumber;
//   final String reraNumber;
//   final String dedNumber;
//   final String referenceNumber;
//   final String phoneNumber;
//   final String whatsappNumber;
//   final String posterName;
//   final String posterAvatar;
//   final String devCompany;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.network(
//             posterAvatar,
//             height: 80,
//             width: 80,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const Gap(8),
//         Text(
//           posterName,
//           style: context.textTheme.bodyLarge?.copyWith(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           'View all properties ',
//           style: context.textTheme.bodyMedium?.copyWith(
//             color: AppColors.selectedBlue,
//           ),
//         ),
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               devCompany,
//               style: context.textTheme.bodyMedium?.copyWith(
//                 color: AppColors.grey,
//               ),
//             ),
//             const Icon(
//               Icons.arrow_forward_ios,
//               size: 15,
//               color: AppColors.grey,
//             )
//           ],
//         ),
//         const Gap(AppValues.padding),
//         MoreInformationOfPosterSection(
//           permitNumber: permitNumber,
//           reraNumber: reraNumber,
//           dedNumber: dedNumber,
//           referenceNumber: referenceNumber,
//         ),
//         _buildBottomCallSection(context),
//       ],
//     );
//   }
//
//   Widget _buildBottomCallSection(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: AppValues.padding,
//         vertical: AppValues.halfPadding,
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: MakePhoneCall(phoneNumber: phoneNumber),
//           ),
//           const Gap(10),
//           Expanded(
//             child: MakeWhatsAppCall(whatsappNumber: whatsappNumber),
//           ),
//         ],
//       ),
//     );
//   }
// }
