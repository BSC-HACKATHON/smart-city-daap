
import 'package:bsc/core/constant/endpointes.dart';
import 'package:bsc/shared/utils/dio_client.dart';
import 'package:bsc/shared/utils/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/signin_req_params.dart';
import '../models/signup_req_params.dart';

abstract class AuthApiService {

  Future<Either> signup(SignupReqParams signupReq);
  Future<Either> getUser();
  Future<Either> signin(SigninReqParams signinReq);
} 

class AuthApiServiceImpl extends AuthApiService {
  

  @override
  Future<Either> signup(SignupReqParams signupReq) async {
    try {

     var response = await sl<DioClient>().post(
        ApiUrls.register,
        data: signupReq.toMap(),
        body: '', headers: {}
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getUser() async {
    
    try {
       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
       var token = sharedPreferences.getString('token');
       var response = await sl<DioClient>().get(
        ApiUrls.userProfile,
        options: Options(
          headers: {
            'Authorization' : 'Bearer $token '
          }
        )
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> signin(SigninReqParams signinReq) async {
    try {

     var response = await sl<DioClient>().post(
        ApiUrls.login,
        data: signinReq.toMap(), body: '', headers: {}
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
  
}