import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goldenboys/barbershop/model/barbershop.dart';
import 'package:goldenboys/user/model/user.dart';
import 'package:goldenboys/user/ui/widgets/profile_barbershop.dart';

class CloudFirestoreAPI {

  final String USERS = "users";
  final String PHOTOS = "photos";

  final Firestore _db = Firestore.instance; //va a obtener la entidad del usuario y  la va a dejar disponibe para la entidad base de datos
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
      'title': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myfavoritePhotos': user.myFavoritePhotos,
      'lastSignIn': DateTime.now()
    }, merge: true);//esto es para que se aplique a la base de datos
  }

  Future<void> updateBarbershopData(Barbershop barbershop) async{
    CollectionReference refBarbershop = _db.collection(PHOTOS);

    await _auth.currentUser().then((FirebaseUser user){
      refBarbershop.add({
        'title': barbershop.name,
        'description': barbershop.description,
        'likes': barbershop.likes,
        'urlImage': barbershop.urlImage,
        'userOwner': _db.document("${USERS}/${user.uid}"),//este es un tipo de dato reference
      }).then((DocumentReference dr){
        dr.get().then((DocumentSnapshot snapshot){
          // lo que hará esto es devolverme el id de Barbershop, ademas necesito es ingrsar este id como una referencia y como un array
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);
          refUsers.updateData({
            'myPhotos' : FieldValue.arrayUnion([_db.document("${PHOTOS}/${snapshot.documentID}")])
          });

        });
      });
    });

  }

  List<ProfileBarbershop> buildMyPhotos(List<DocumentSnapshot> photosListSnapshot){
    List<ProfileBarbershop> profileBarbershop = List<ProfileBarbershop>();
    photosListSnapshot.forEach((p) {
      profileBarbershop.add(ProfileBarbershop(
        Barbershop(name: p.data['title'],
            description: p.data['description'],
            urlImage: p.data['urlImage'],
            likes: p.data['likes']
        ),
      ));
    });

    return profileBarbershop;
  }

  List<Barbershop> buildPhotos(List<DocumentSnapshot> photosListSnapshot, User user){
    List<Barbershop> photos = List<Barbershop>();

    photosListSnapshot.forEach((p) {
      Barbershop barbershop = Barbershop(id: p.documentID, name: p.data["name"], description: p.data["description"], urlImage: p.data["urlImage"], likes: p.data["likes"]);
      List usersLikedRefs = p.data["usersLiked"];
      barbershop.liked = false;
      usersLikedRefs?.forEach((drUL) {
        if(user.uid == drUL.documentID){
          barbershop.liked = true;
        }
      });
      photos.add(barbershop);
    });

    return photos;
  }

  Future likePhoto(Barbershop barbershop, String uid) async {
    await _db.collection(PHOTOS).document(barbershop.id).get()
        .then((DocumentSnapshot ds){
      int likes = ds.data["likes"];

      _db.collection(PHOTOS).document(barbershop.id)
          .updateData({
        'likes': barbershop.liked?likes+1:likes-1,
        'usersLiked':
        barbershop.liked?
        FieldValue.arrayUnion([_db.document("${USERS}/${uid}")]):
        FieldValue.arrayRemove([_db.document("${USERS}/${uid}")])
      });
    });
  }

}



/*esto es lo que hizo Javier alumno de platzi
  lo que hace este ocdigo es: cuando dos usuarios le den like a la misma foto
  haga el conteo de los dos

_db.runTransaction((transaction) async {
DocumentSnapshot photoDS = await
_db.collection(this.PHOTOS).document(idPhoto).get();
await transaction.update(photoDS.reference, {"likes":
photoDS.data['likes'] + 1
});
});*/