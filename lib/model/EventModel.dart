import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  //key
  static const String collectionName = 'Events';
  //data
  String id;
  String eventImage;
  String eventName;
  String eventTitle;
  String eventDescription;
  DateTime eventDate;
  String eventTime;
  bool isFavorite;

  //constructor
  EventModel({
    this.id = '',
    this.isFavorite = false,
    required this.eventImage,
    required this.eventName,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDate,
    required this.eventTime,

  });

  // Object to json
Map<String,dynamic>toJson(){
  return
    {
      'id':id,
      'eventImage':eventImage,
      'eventName':eventName,
      'eventTitle':eventTitle,
      'eventDescription':eventDescription,
      'eventDate':eventDate,
      'eventTime':eventTime,
      'isFavorite':isFavorite,
    };
    }
    //json to object
EventModel.toObject(Map<String,dynamic>data):this(
  id: data['id'],
  isFavorite: data['isFavorite'],
  eventImage: data['eventImage'],
  eventName: data['eventName'],
  eventTitle: data['eventTitle'],
  eventDescription: data['eventDescription'],
  eventDate:
  (data['eventDate'] as Timestamp).toDate(),
  eventTime: data['eventTime'],

);
}
