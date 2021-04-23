// To parse this JSON data, do
//
//     final annotations = annotationsFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/core/values/keys.dart';

Annotations annotationsFromJson(String str) =>
    Annotations.fromJson(json.decode(str));

String annotationsToJson(Annotations data) => json.encode(data.toJson());

class Annotations {
  Annotations({
    this.annotations,
  });

  RxList<Rx<Annotation>> annotations;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        annotations: RxList<Rx<Annotation>>.from(
            json[ANNOTATIONS].map((x) => Annotation.fromJson(x).obs)),
      );

  Map<String, dynamic> toJson() => {
        ANNOTATIONS: RxList<dynamic>.from(annotations.map((x) => x.toJson())),
      };
}

class Annotation {
  Annotation({
    this.title,
    this.date,
    this.check,
    this.description,
  });

  String title;
  String date;
  bool check;
  String description;

  factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        title: json["title"],
        date: json["date"],
        check: json["check"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "check": check,
        "description": description,
      };
}
