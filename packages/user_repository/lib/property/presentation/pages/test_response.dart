// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:urgent/core/base/widgets/location_icon.dart';
// import 'package:urgent/core/base/widgets/urgent_appbar.dart';
// import 'package:urgent/core/di/injection_container.dart';
// import 'package:urgent/core/utils/context_extension.dart';
// import 'package:urgent/core/values/app_assets_path.dart';
// import 'package:urgent/core/values/app_values.dart';
// import 'package:urgent/features/filter/filter_result/presentation/pages/vehicle_filter_result_page.dart';
// import 'package:urgent/features/filter/filter_result/presentation/widgets/amenities_icon_and_count.dart';
// import 'package:urgent/features/property/presentation/cubit/profile_details_cubit/property_details_cubit.dart';
// import 'package:urgent/features/property/presentation/widgets/building_information_widget.dart';
// import 'package:urgent/features/property/presentation/widgets/general_information_widget.dart';
// import 'package:urgent/features/property/presentation/widgets/property_details_image_slider.dart';
// import 'package:urgent/features/property/presentation/widgets/property_poster_information_widget.dart';
// import 'package:urgent/features/property/presentation/widgets/specification_information_widget.dart';
// import 'package:urgent/features/property/presentation/widgets/validated_information_widget.dart';
//
// import '../../../../core/values/app_colors.dart';
//
// class TestResponse extends StatefulWidget {
//   const TestResponse({
//     super.key,
//   });
//
//   @override
//   State<TestResponse> createState() => _TestResponseState();
// }
//
// class _TestResponseState extends State<TestResponse> {
//   final cubit = sl.get<PropertyDetailsCubit>();
//
//   @override
//   void initState() {
//     cubit.getPropertyById('c79b1c16-ff11-4466-a37f-f34baf221c42');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildUrgentAppBar(),
//       body: SingleChildScrollView(
//         child: BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
//           bloc: cubit,
//           builder: (context, state) {
//             if (state is PropertyDetailsLoading)
//               return const Center(child: CircularProgressIndicator());
//             if (state is PropertyDetailsError)
//               return Center(child: Text(state.message));
//             if (state is PropertyDetailsLoaded) {
//               return Column(
//                 children: [
//                   MainImageSlider(
//                     imageUrls: carImageUrls,
//                     isVerified: state.propertyEntity.isApproved ?? false,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(AppValues.padding),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildAdCategoryAndCreatedAt(context),
//                         const Gap(4),
//                         _buildAdvertisementTitle(context),
//                         const Gap(AppValues.halfPadding),
//                         _buildPriceText(context),
//                         const Gap(AppValues.halfPadding),
//                         _buildLocation(context),
//                         const Gap(AppValues.halfPadding),
//                         _buildOverView(),
//                       ],
//                     ),
//                   ),
//                   GeneralInformationSection(
//                     purpose: state.propertyEntity.status ?? 'Error',
//                     propertyAge: 'Not Dynamic',
//                     updated:
//                         state.propertyEntity.updatedAt?.toString() ?? 'Error',
//                     completionStatus:
//                         state.propertyEntity.completionStatus ?? 'Error',
//                     serviceCharge: 'Not Dynamic',
//                   ),
//                   SpecificationSection(
//                     propertyType: state.propertyEntity.type ?? 'Error',
//                     bedrooms: 'state.propertyEntity.bedrooms.toString()',
//                     bathrooms: 'state.propertyEntity.bathrooms.toString()',
//                     drawingRoom: 'Not Dynamic',
//                     kitchen: 'Not Dynamic',
//                     areaSize: 'state.propertyEntity.areaSize.toString()',
//                   ),
//                   const ValidatedInformationSection(
//                     developer: 'Not Dynamic',
//                     ownership: 'Not Dynamic',
//                     usage: 'Not Dynamic',
//                   ),
//                   const BuildingInformationSection(
//                     buildingName: 'Not Dynamic',
//                     floors: 'Not Dynamic',
//                     retailCenters: 'Not Dynamic',
//                   ),
//                   _buildMapView(context),
//                   const Gap(AppValues.padding),
//                   PropertyPosterInformationSection(
//                     phoneNumber: 'Error',
//                     whatsappNumber: 'Error',
//                     posterAvatar: 'Not Dynamic',
//                     posterName: 'state.propertyEntity.listedBy ??',
//                     devCompany: 'Not Dynamic',
//                     permitNumber: 'Not Dynamic',
//                     reraNumber: 'Not Dynamic',
//                     dedNumber: 'Not Dynamic',
//                     referenceNumber: 'Not Dynamic',
//                   ),
//                 ],
//               );
//             } else {
//               return const SizedBox();
//             }
//           },
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
