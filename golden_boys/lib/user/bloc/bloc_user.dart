import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:goldenboys/barbershop/model/barbershop.dart';
import 'package:goldenboys/barbershop/repository/firebase_storage_repository.dart';
import 'package:goldenboys/barbershop/ui/widgets/card_image_gallery.dart';
import 'package:goldenboys/user/model/user.dart';
import 'package:goldenboys/user/repository/auth_repository.dart';
import 'package:goldenboys/user/repository/cloud_firestore_api.dart';
import 'package:goldenboys/user/repository/cloud_firestore_repository.dart';
import 'package:goldenboys/user/ui/widgets/profile_barbershop.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos o Streams
  //Streams - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase; //el objeto authStatus nos va a devolver el estado de la sesion

  //esto es un metodo que es un futuro que me devuelva un FirebaseUser
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Casos de uso de la app
  //1. SignIn a la aplicación Google
  Future<FirebaseUser>signIn() => _auth_repository.signInFirebase();


  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updateBarbershopDate(Barbershop barbershop) => _cloudFirestoreRepository.updateBarbershopData(barbershop);
  Stream<QuerySnapshot> photosListStream = Firestore.instance.collection(CloudFirestoreAPI().PHOTOS).snapshots();
  Stream<QuerySnapshot> get photosStream => photosListStream;
  //List<CardImageGallery> buildPhotos(List<DocumentSnapshot> photosListSnapshot) =>_cloudFirestoreRepository.buildPhotos(photosListSnapshot);
  List<Barbershop> buildPhotos(List<DocumentSnapshot> photosListSnapshot, User user) => _cloudFirestoreRepository.buildPhotos(photosListSnapshot, user);
  Future likePhoto(Barbershop barbershop, String uid) => _cloudFirestoreRepository.likePhoto(barbershop, uid);

  Stream<QuerySnapshot> myPhotosListStream(String uid) =>
      Firestore.instance.collection(CloudFirestoreAPI().PHOTOS)
      .where("userOwner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/${uid}"))
      .snapshots();
  List<ProfileBarbershop> buildMyPhotos(List<DocumentSnapshot> photosListSnapshot) => _cloudFirestoreRepository.buildMyPhotos(photosListSnapshot);


  //esto agregue
  StreamController<Barbershop> barbershopSelectedStreamController =  StreamController<Barbershop>();
  Stream<Barbershop> get barbershopSelectedStream => barbershopSelectedStreamController.stream;
  StreamSink<Barbershop> get barbershopSelectedSink =>  barbershopSelectedStreamController.sink;


  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  signOut(){
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}