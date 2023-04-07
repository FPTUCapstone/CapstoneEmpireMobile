class BrandResponseModel {
  BrandResponseModel({
    required this.id,
    required this.name,
    required this.models,
  });

  final int id;
  final String name;
  final List<ModelResponseModel> models;

  factory BrandResponseModel.fromJson(Map<String, dynamic> json) {
    var modelList = json['models'] as List<dynamic>;
    List<ModelResponseModel> models =
        modelList.map((model) => ModelResponseModel.fromJson(model)).toList();

    return BrandResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      models: models,
    );
  }
}

class ModelResponseModel {
  ModelResponseModel({
    required this.id,
    required this.code,
    required this.name,
  });

  final int id;
  final String code;
  final String name;
  factory ModelResponseModel.fromJson(Map<String, dynamic> json) {
    return ModelResponseModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
    );
  }
}
