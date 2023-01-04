import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/models/marketplace_entity.dart';
import 'package:anaaj/models/receiver_instituition.dart';
import 'package:anaaj/models/volunteer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/role.dart';

class AuthenticationServices {
  String donorInstituitionsPath = 'donor_instituitions';
  String volunteersPath = 'volunteers';
  String receiverInstituitionsPath = 'receiver_instituitions';

  CollectionReference<Map<String, dynamic>> get donorInstituitionsCollection {
    return FirebaseFirestore.instance.collection(donorInstituitionsPath);
  }

  CollectionReference<Map<String, dynamic>> get volunteersCollection {
    return FirebaseFirestore.instance.collection(volunteersPath);
  }

  CollectionReference<Map<String, dynamic>>
      get receiverInstituitionsCollection {
    return FirebaseFirestore.instance.collection(receiverInstituitionsPath);
  }

  /// Returns [DonorInstituition] or [Volunteer] or [ReceiverInstituition]
  Future<Object?> fetchUserByPhoneNumber(int phoneNumber, Role role) async {
    Object? user;
    switch (role) {
      case Role.donor:
        user = fetchDonorInstituition(phoneNumber);
        break;
      case Role.volunteer:
        user = fetchVolunteer(phoneNumber);
        break;
      case Role.receiver:
        user = fetchReceiverInstituition(phoneNumber);
        break;
      default:
    }

    return user;
  }

  Future<DonorInstituition?> fetchDonorInstituition(int phoneNumber) async {
    final rawDonorInstitution =
        await donorInstituitionsCollection.doc(phoneNumber.toString()).get();
    if (rawDonorInstitution.data() != null) {
      return DonorInstituition.fromJson(rawDonorInstitution.data()!);
    }
    return null;
  }

  Future<Volunteer?> fetchVolunteer(int phoneNumber) async {
    final rawVolunteer =
        await volunteersCollection.doc(phoneNumber.toString()).get();
    if (rawVolunteer.data() != null) {
      return Volunteer.fromJson(rawVolunteer.data()!);
    }
    return null;
  }

  Future<ReceiverInstituition?> fetchReceiverInstituition(
      int phoneNumber) async {
    final rawReceiverInstitution =
        await receiverInstituitionsCollection.doc(phoneNumber.toString()).get();
    if (rawReceiverInstitution.data() != null) {
      return ReceiverInstituition.fromJson(rawReceiverInstitution.data()!);
    }
    return null;
  }

  /// Creates a user in FirebaseAuth & saves the data to respective collection
  Future<UserCredential> createDonorInstituition(
      DonorInstituition donorInstituition,
      PhoneAuthCredential phoneAuthCredential) async {
    UserCredential credentials =
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

    DonorInstituition donor =
        donorInstituition.copyWith(id: credentials.user!.uid);
    await FirebaseFirestore.instance
        .collection(donorInstituitionsPath)
        .doc(donor.phoneNumber.toString())
        .set(donor.toJson());

    MarketplaceEntity entity = MarketplaceEntity.raw(donorInstituition);
    await FirebaseFirestore.instance
        .collection('marketplace')
        .doc(donor.phoneNumber.toString())
        .set(entity.toJson());

    return credentials;
  }

  /// Creates a user in FirebaseAuth & saves the data to respective collection
  Future<UserCredential> createReceiverInstituition(
      ReceiverInstituition receiverInstituition,
      PhoneAuthCredential phoneAuthCredential) async {
    UserCredential credentials =
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

    ReceiverInstituition receiver =
        receiverInstituition.copyWith(id: credentials.user!.uid);
    await FirebaseFirestore.instance
        .collection(receiverInstituitionsPath)
        .doc(receiver.phoneNumber.toString())
        .set(receiver.toJson());

    return credentials;
  }

  /// Creates a user in FirebaseAuth & saves the data to respective collection
  Future<UserCredential> createVolunteer(
      Volunteer volunteer, PhoneAuthCredential phoneAuthCredential) async {
    UserCredential credentials =
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

    Volunteer middlemen = volunteer.copyWith(id: credentials.user!.uid);
    await FirebaseFirestore.instance
        .collection(volunteersPath)
        .doc(middlemen.phoneNumber.toString())
        .set(middlemen.toJson());

    return credentials;
  }

  Future<UserCredential> signInUser(
      PhoneAuthCredential phoneAuthCredential) async {
    UserCredential credentials =
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    return credentials;
  }
}
