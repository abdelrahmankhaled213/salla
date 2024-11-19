class AddOrDeleteCartResponse {

  final bool status;
  final String message;

  AddOrDeleteCartResponse({required this.status, required this.message});

  factory AddOrDeleteCartResponse.fromJson(Map<String, dynamic> json) {
    return AddOrDeleteCartResponse(
        status: json['status'],
        message: json['message']

    );
  }

}