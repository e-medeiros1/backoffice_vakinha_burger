// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentTypeModel {
  final int? id;
  final String name;
  final String acronym;
  final bool enabled;

  PaymentTypeModel(this.id, this.name, this.acronym, this.enabled);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'acronym': acronym,
      'enabled': enabled,
    };
  }

  factory PaymentTypeModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypeModel(
      map['id'] != null ? map['id'] as int : null,
      map['name'] as String,
      map['acronym'] as String,
      map['enabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypeModel.fromJson(String source) => PaymentTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
