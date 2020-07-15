import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goldenboys/barbershop/model/barbershop.dart';
import 'package:goldenboys/barbershop/ui/widgets/card_image_gallery.dart';
import 'package:goldenboys/user/model/user.dart';
import 'package:goldenboys/user/repository/cloud_firestore_api.dart';
import 'package:goldenboys/user/ui/widgets/profile_barbershop.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) async => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updateBarbershopData(Barbershop barbershop) => _cloudFirestoreAPI.updateBarbershopData(barbershop);

  List<ProfileBarbershop> buildMyPhotos(List<DocumentSnapshot> photosListSnapshot) => _cloudFirestoreAPI.buildMyPhotos(photosListSnapshot);

  List<Barbershop> buildPhotos(List<DocumentSnapshot> photosListSnapshot, User user) => _cloudFirestoreAPI.buildPhotos(photosListSnapshot, user);

  Future likePhoto(Barbershop barbershop, String uid) => _cloudFirestoreAPI.likePhoto(barbershop, uid);
}