import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class TaskModel {
  DateTime date;
  //DateTime time;
  String title;
  String description;
  String category;
  String id;
  bool isFavorite  ;
  TaskModel({
    required this.description,
    required this.category,
    required this.date,
    this.id = "",
    required this.title,
    this.isFavorite=false
  });
  TaskModel.fromJson(Map<String, Object?>json) :this(
    category: json['category'] as String,
    description: json['description'] as String,
    date:  (json['date'] as Timestamp).toDate(),
    //time: (json['time'] as Timestamp).toDate(),
    title: json['title'] as String,
    id: json['id'] as String,
    isFavorite: json['isFavorite'] as bool,
  );
  Map<String,Object?>toJson(){
    return{
      'category':category,
      'description':description,
      'date':date,
      'title':title,
      'id':id,
      'isFavorite':isFavorite,

    };
  }

}
