import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventify/model/EventModel.dart';

class FireBaseUtils {
  ///fireBase FireStore
  //todo: readData
  static CollectionReference<EventModel> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) =>
              EventModel.toObject(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }
  //todo: WriteData
  static addEventToFireStore(EventModel event) {
    CollectionReference<EventModel> eventCollection =
        getEventCollection(); // add collection
    DocumentReference<EventModel> eventDocument = eventCollection.doc();
  event.id =eventDocument.id; // auto id
  return eventDocument.set(event); // add data
  }
  //todo: Realtime Read Data
  static Stream<QuerySnapshot<EventModel>>getEventsStream(){
    return getEventCollection().snapshots();
  }
  //todo: Update Data
  static updateEvent(EventModel event) {
    getEventCollection().doc(event.id).update(event.toJson());
  }
  //todo: Delete Data
  static deleteEvent(String id) {
    getEventCollection().doc(id).delete();
  }

}
