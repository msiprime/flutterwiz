// import 'package:urgent/core/base/domain/base_response.dart';
// import 'package:urgent/features/property/domain/entities/contact_info.dart';
//
// class ContactInfo extends BaseResponse<ContactInfoEntity> {
//   String? phone;
//   String? email;
//   String? whatsapp;
//
//   ContactInfo({this.phone, this.email, this.whatsapp});
//
//   ContactInfo.fromJson(Map<String, dynamic> json) {
//     phone = json['phone'];
//     email = json['email'];
//     whatsapp = json['whatsapp'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['phone'] = phone;
//     data['email'] = email;
//     data['whatsapp'] = whatsapp;
//     return data;
//   }
//
//   @override
//   ContactInfoEntity toEntity() {
//     return ContactInfoEntity(phone: phone, email: email, whatsapp: whatsapp);
//   }
// }
