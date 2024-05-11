import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'checkinternet.dart';
import 'statuscode.dart';

String _basicAuth = 'Basic ' + base64Encode(utf8.encode('temsah13:16797346'));

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<Either<StatusRequest, List<dynamic>>> getData(
      String collection) async {
    try {
      if (await checkInternetConnection()) {
        QuerySnapshot querySnapshot =
            await FirebaseFirestore.instance.collection(collection).get();
        List<dynamic> userDataList = [];

        querySnapshot.docs.forEach((doc) {
          userDataList.add(doc.data());
        });
      

        return right(userDataList);
      } else {
        return left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return left(StatusRequest.serverFailure);
    }
  }

  Future<StatusRequest> postData(
      String collection, Map<String, String> data) async {
    try {
      if (await checkInternetConnection()) {
        CollectionReference items = firestore.collection(collection);
        await items.add(data);
        return StatusRequest.success;
      } else {
        return StatusRequest.serverFailure;
      }
    } catch (e) {
      return StatusRequest.serverFailure;
    }
  }

  postRequsetWithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multypartfile = http.MultipartFile('file', stream, length,
        filename: basename(file.path));
    request.headers.addAll(myheaders);
    request.files.add(multypartfile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error ${myrequest.statusCode}");
    }
  }
}
