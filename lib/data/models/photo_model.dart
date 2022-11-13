class PhotoModel {
  String secureUrl;
  String publicId;

  PhotoModel({required this.publicId, required this.secureUrl});


  factory PhotoModel.fromJson(Map<String,dynamic> json){
    return PhotoModel(
      publicId: json['publicId'], 
      secureUrl: json['secureUrl']
    );
  }

  Map<String,dynamic> toJson() => {
    "publicId":publicId,
    "secureUrl":secureUrl
  };
}
