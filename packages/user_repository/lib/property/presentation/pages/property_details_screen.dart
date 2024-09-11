// // import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:urgent/core/base/widgets/location_icon.dart';
// import 'package:urgent/core/base/widgets/urgent_appbar.dart';
// import 'package:urgent/core/utils/context_extension.dart';
// import 'package:urgent/core/values/app_assets_path.dart';
// import 'package:urgent/core/values/app_values.dart';
// import 'package:urgent/features/filter/filter_result/presentation/pages/vehicle_filter_result_page.dart';
// import 'package:urgent/features/filter/filter_result/presentation/widgets/amenities_icon_and_count.dart';
// import 'package:urgent/features/home/domain/entity/property/property_entity.dart';
// import 'package:urgent/features/property/presentation/widgets/building_information_widget.dart';
// import 'package:urgent/features/property/presentation/widgets/general_information_widget.dart';
// import 'package:urgent/features/property/presentation/widgets/property_details_image_slider.dart';
// import 'package:urgent/features/property/presentation/widgets/property_poster_information_widget.dart';
// import 'package:urgent/features/property/presentation/widgets/specification_information_widget.dart';
// import 'package:urgent/features/property/presentation/widgets/validated_information_widget.dart';
//
// import '../../../../core/values/app_colors.dart';
//
// class PropertyDetailsScreen extends StatelessWidget {
//   const PropertyDetailsScreen({
//     super.key,
//     required this.propertyEntity,
//   });
//
//   final PropertyEntity propertyEntity;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildUrgentAppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             MainImageSlider(
//               imageUrls: carImageUrls,
//               isVerified: propertyEntity.isApproved ?? false,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(AppValues.padding),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildAdCategoryAndCreatedAt(context),
//                   const Gap(4),
//                   _buildAdvertisementTitle(context),
//                   const Gap(AppValues.halfPadding),
//                   _buildPriceText(context),
//                   const Gap(AppValues.halfPadding),
//                   _buildLocation(context),
//                   const Gap(AppValues.halfPadding),
//                   _buildOverView(),
//                 ],
//               ),
//             ),
//             GeneralInformationSection(
//               purpose: propertyEntity.status ?? 'Error',
//               propertyAge: 'Not Dynamic',
//               updated: propertyEntity.updatedAt?.toIso8601String() ?? 'Error',
//               completionStatus: propertyEntity.completionStatus ?? 'Error',
//               serviceCharge: 'Not Dynamic',
//             ),
//             SpecificationSection(
//               propertyType: propertyEntity.type ?? 'Error',
//               bedrooms: propertyEntity.bedrooms.toString(),
//               bathrooms: propertyEntity.bathrooms.toString(),
//               drawingRoom: 'Not Dynamic',
//               kitchen: 'Not Dynamic',
//               areaSize: propertyEntity.areaSize.toString(),
//             ),
//             const ValidatedInformationSection(
//               developer: 'Not Dynamic',
//               ownership: 'Not Dynamic',
//               usage: 'Not Dynamic',
//             ),
//             const BuildingInformationSection(
//               buildingName: 'Not Dynamic',
//               floors: 'Not Dynamic',
//               retailCenters: 'Not Dynamic',
//             ),
//             _buildMapView(context),
//             const Gap(AppValues.padding),
//             PropertyPosterInformationSection(
//               phoneNumber: 'Error',
//               whatsappNumber: 'Error',
//               posterAvatar: 'Not Dynamic',
//               posterName: propertyEntity.listedBy ?? 'Error',
//               devCompany: 'Not Dynamic',
//               permitNumber: 'Not Dynamic',
//               reraNumber: 'Not Dynamic',
//               dedNumber: 'Not Dynamic',
//               referenceNumber: 'Not Dynamic',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMapView(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const Gap(AppValues.halfPadding),
//           Text(
//             'Map View',
//             style: context.textTheme.bodyLarge?.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Gap(8),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/w_2240,c_limit/GoogleMapTA.jpg',
//               fit: BoxFit.fitWidth,
//               height: 190,
//               width: context.width,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   UrgentAppBar _buildUrgentAppBar() {
//     return UrgentAppBar(
//       title: 'Villa',
//       actions: [
//         IconButton(
//           padding: EdgeInsets.zero,
//           visualDensity: VisualDensity.compact,
//           onPressed: () {},
//           icon: const Icon(Icons.favorite_border),
//         ),
//         IconButton(
//           padding: EdgeInsets.zero,
//           visualDensity: VisualDensity.compact,
//           onPressed: () {},
//           icon: const Icon(Icons.flag_outlined),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildOverView() {
//     return const Row(
//       children: [
//         IconAndCount(
//           icon: AppAssets.bathroomIcon,
//           count: '5',
//         ),
//         Gap(AppValues.padding),
//         IconAndCount(
//           icon: AppAssets.bathroomIcon,
//           count: '12',
//         ),
//         Gap(AppValues.padding),
//         IconAndCount(
//           icon: AppAssets.furnitureIcon,
//           count: '12',
//         ),
//         Gap(AppValues.padding),
//         IconAndCount(
//           icon: AppAssets.areaSizeIcon,
//           count: '32',
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPriceText(BuildContext context) {
//     return Text(
//       'AED 85,000,000',
//       style: context.theme.textTheme.headlineSmall?.copyWith(
//         color: AppColors.priceColor2,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
//
//   Widget _buildAdvertisementTitle(BuildContext context) {
//     return Text(
//       'Luxury Villa with Private Beach and Pool in Palm Jumeirah',
//       style: context.theme.textTheme.titleLarge,
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//     );
//   }
//
//   Widget _buildAdCategoryAndCreatedAt(BuildContext context) {
//     return SizedBox(
//       height: context.height * 0.02,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('Villa', style: context.theme.textTheme.bodySmall),
//           const Spacer(),
//           Text('Listed 4 days ago', style: context.theme.textTheme.bodySmall),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLocation(BuildContext context) {
//     return Row(
//       children: [
//         CustomPaint(
//           painter: LocationIcon(),
//           size: const Size(15, 20),
//         ),
//         const Gap(5),
//         Text(
//           'Palm Jumeirah, Dubai, United Arab Emirates',
//           style: context.theme.textTheme.bodyMedium?.copyWith(
//             color: AppColors.locationColor,
//           ),
//         ),
//       ],
//     );
//   }
// }
