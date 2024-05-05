// To parse this JSON data, do
//
//     final doctorDetailsModel = doctorDetailsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';
import 'dart:io';

UseModel useModelFromJson(String str) => UseModel.fromJson(json.decode(str));

String useModelToJson(UseModel data) => json.encode(data.toJson());

class UseModel {
  String? message;
  bool? success;
  UserData? data;
  dynamic errorForDev;

  UseModel({
    this.message,
    this.success,
    this.data,
    this.errorForDev,
  });

  factory UseModel.fromJson(Map<String, dynamic> json) => UseModel(
        message: json['message'],
        success: json['success'],
        // data: UserData.fromJson(json['data']),
        errorForDev: json['error_for_dev'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        // 'data': data!.toJson(),
        'error_for_dev': errorForDev,
      };
}

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  File? image;
  int? salary;
  String? gender;
  String? userType;
  String? about;
  String? birthday;

  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.password,
    this.email,
    this.image,
    this.salary,
    this.gender,
    this.userType,
    this.about,
    this.birthday,
  });

  // factory UserData.fromJson(Map<String, dynamic> json) => UserData(
  //       id: json['id'],
  //       fullName: json['full_name'],
  //       slug: json['slug'] == null ? null : json['slug'],
  //       title: json['title'] == null ? null : json['title'],
  //       description: json['description'],
  //       profile: json['profile'] == null ? null : json['profile'],
  //       sessionPrice: json['session_price'],
  //       consultationPrice: json['consultation_price'],
  //       sessionDuration: json['session_duration'],
  //       featured: json['featured'] == null ? null : json['featured'],
  //       departments: List<Department>.from(
  //           json['departments'].map((x) => Department.fromJson(x))),
  //       experiences: json['experiences'] == null ? null : json['experiences'],
  //       educations: json['educations'] == null ? null : json['educations'],
  //       videoLink: json['video_link'] == null ? null : json['video_link'],
  //     );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'full_name': fullName,
  //       'slug': slug,
  //       'title': title,
  //       'description': description,
  //       'profile': profile,
  //       'session_price': sessionPrice,
  //       'consultation_price': consultationPrice,
  //       'session_duration': sessionDuration,
  //       'featured': featured,
  //       'departments': List<dynamic>.from(departments!.map((x) => x.toJson())),
  //       'experiences': experiences,
  //       'educations': educations,
  //     };
}
