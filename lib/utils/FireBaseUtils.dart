import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventify/model/EventModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
///fireBase AUTH
  // todo: create user (register)
static  Future<UserCredential?> register (
    String emailAddress,
    String password,
    String name,
    )async{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    await credential.user?.sendEmailVerification();
    await credential.user?.updateDisplayName(name);
    print('register successfully');
    print('id: ${credential.user!.uid}');
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return null;
}
// todo: create user (Login)
static Future<UserCredential?> login (String emailAddress,String password)async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
    if(credential.user!.emailVerified){
      return credential;
    }else{
      print('email not verified');
    }

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
return null;
}
  //todo: send reset password
  static Future<void> sendPasswordResetEmail(String emailAddress)async{
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailAddress);
  }
}
