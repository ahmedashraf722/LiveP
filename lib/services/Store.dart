import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_register_auth/model/post.dart';

import '../constants.dart';

class Store {
  final Firestore _firestore = Firestore.instance;

  addPost(Post post) {
    _firestore.collection(kPostCollection).add({
      kPostName: post.pName,
      kPostpSymptoms: post.pSymptoms,
      kpostpreason: post.preason,
      kPostLocation: post.pAddrees,
      kPostType: post.Ptreatment,
      kPostnumberdie: post.Pnumberdie,
      kPostNumberWorker: post.pNumberWorker,
      kPostNumberWorkerAfter: post.pnumberWorkerafter,
      kPostAge: post.Page,
      kPostlinkVid: post.plinkVid,
      kPostDate: post.pDate,
    });
  }

  Stream<QuerySnapshot> loadPost() {
    return _firestore.collection(kPostCollection).snapshots();
  }

  deletePost(documentId) {
    _firestore.collection(kPostCollection).document(documentId).delete();
  }

  editPost(data, documentId) {
    _firestore
        .collection(kPostCollection)
        .document(documentId)
        .updateData(data);
  }
}
