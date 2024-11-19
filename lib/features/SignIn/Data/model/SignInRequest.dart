class SignInRequest{
  final String email;
  final String password;
SignInRequest({
   required this.email,
  required this.password
});
Map<String,dynamic> toJson(SignInRequest request){
 return {
     "email": request.email,
   "password": request.password
 };
}
}