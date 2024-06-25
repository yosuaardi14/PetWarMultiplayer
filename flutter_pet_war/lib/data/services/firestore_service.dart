import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>?>> getCollectionStream(String collection) {
    return _db.collection(collection).snapshots().map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Stream<Map<String, dynamic>?> getCollectionByDocIdStream(
    String collection,
    String id,
  ) {
    return _db.collection(collection).doc(id).snapshots().map((snapshot) => snapshot.data());
  }

  //
  Future<List<Map<String, dynamic>?>> getCollection(
    String collection,
  ) async {
    final data = await _db.collection(collection).get();
    return data.docs.map((e) => e.data()).toList();
  }

  Future<Map<String, dynamic>?> getCollectionByDocId(
    String collection,
    String id,
  ) async {
    final data = await _db.collection(collection).doc(id).get();
    return data.data();
  }

  Future<void> addData(
    String collection,
    String id,
    Map<String, dynamic> data, {
    bool allowReplace = true,
  }) async {
    if (allowReplace) {
      await _db.collection(collection).doc(id).set(data);
      // await _db.collection(collection).add(data);
    } else {
      var docRef = _db.collection(collection).doc(id);
      var doc = await docRef.get();

      if (!doc.exists) {
        await docRef.set(data);
      } else {
        throw Exception('Document with ID $id already exists in $collection.');
      }
    }
  }

  Future<void> updateData(
    String collection,
    String id,
    Map<String, dynamic> data,
  ) async {
    await _db.collection(collection).doc(id).set(data, SetOptions(merge: true));
    // await _db.collection(collection).doc(id).update(data);
  }

  Future<void> deleteData(
    String collection,
    String id,
  ) async {
    await _db.collection(collection).doc(id).delete();
  }
}
