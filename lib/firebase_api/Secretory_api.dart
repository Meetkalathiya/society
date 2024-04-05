import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';


final FirebaseFirestore _firestore =  FirebaseFirestore.instance;

class Usercrud{
  static Future<Response>addUser(
    {
      required String firstname,
      required String lastname,
      required String Wing,
      required String Flatno,
      required String User,
      required String Mobileno,
      required String Password,
    }
  )async{
    final CollectionReference _Collection = _firestore.collection('User');
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();
    final now = DateTime.now();
    Map<String, dynamic> data = <String, dynamic>{
      "first_name": firstname,
      "last_name": lastname,
      "Wing": Wing,
      "Flatno": Flatno,
      "User": User,
      "Mobileno": Mobileno,
      "Password": Password,
      "status":true,
  };
  var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });
    if (response.code == 200) {
      response.id = documentReferencer.id;
    }
    return response;}}