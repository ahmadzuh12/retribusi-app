import 'dart:convert';
import 'dart:io';

import 'package:retribusi_app/bloc/viewModel/area_tagih_model.dart';
import 'package:retribusi_app/bloc/viewModel/user_model.dart';
import 'package:retribusi_app/network/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:retribusi_app/ui/common/util/toast_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Webservice {
  UserModel userModel = UserModel();
  Areatagih areatagih = Areatagih();

  //Api Data Login
  Future<UserModel> login(String email, password) async {
    Map userdata = {
      'email': email,
      'password': password,
      'device_name': 'Mobile'
    };
    final response = await http.post(ApiService.loginUrl, body: userdata);
    if (response.statusCode == 200) {
      print(response.body);
      return UserModel.fromJson(json.decode(response.body));
    } else {
      ToastUtils.show('Gagal Load Data');
    }
    return null;
  }
}

class Areatagih {
  //Api Mengambil Data List
  Future<List<AreaTagih>> areaTagih() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await http.post(
      ApiService.listUrl,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
    );

    if (response.statusCode == 200) {
      return areatagihFromJson(response.body);
    } else {
      print(token);
    }
    return null;
  }
}

//   Future<User> changePassword(
//       String old_password, new_password, confirm_new_password) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString("token");
//     Map resetPasswordData = {
//       'old_password': old_password,
//       'new_password': new_password,
//       'confirm_new_password': confirm_new_password
//     };
//     final response = await http.post(
//       '$url/user/changePassword',
//       headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
//       body: resetPasswordData,
//     );

//     if (response.statusCode == 200) {
//       return User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to change Password');
//     }
//   }
// }
