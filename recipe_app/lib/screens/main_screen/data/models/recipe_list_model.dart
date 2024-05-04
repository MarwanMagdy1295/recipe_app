// To parse this JSON data, do
//
//     final recipeListModel = recipeListModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<RecipeListModel> recipeListModelFromJson(String str) =>
    List<RecipeListModel>.from(
        json.decode(str).map((x) => RecipeListModel.fromJson(x)));

String recipeListModelToJson(List<RecipeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeListModel {
  String? id;
  String? fats;
  String? name;
  String? time;
  String? image;
  List<String>? weeks;
  String? carbos;
  String? fibers;
  double? rating;
  String? country;
  int? ratings;
  String? calories;
  String? headline;
  List<String>? keywords;
  List<String>? products;
  String? proteins;
  int? favorites;
  int? difficulty;
  String? description;
  bool? highlighted;
  List<String>? ingredients;
  dynamic incompatibilities;
  List<String>? deliverableIngredients;
  List<dynamic>? undeliverableIngredients;

  RecipeListModel({
    this.id,
    this.fats,
    this.name,
    this.time,
    this.image,
    this.weeks,
    this.carbos,
    this.fibers,
    this.rating,
    this.country,
    this.ratings,
    this.calories,
    this.headline,
    this.keywords,
    this.products,
    this.proteins,
    this.favorites,
    this.difficulty,
    this.description,
    this.highlighted,
    this.ingredients,
    this.incompatibilities,
    this.deliverableIngredients,
    this.undeliverableIngredients,
  });

  factory RecipeListModel.fromJson(Map<String, dynamic> json) =>
      RecipeListModel(
        id: json["id"] == null ? null : json["id"],
        fats: json["fats"] == null ? null : json["fats"],
        name: json["name"] == null ? null : json["name"],
        time: json["time"] == null ? null : json["time"],
        image: json["image"] == null ? null : json["image"],
        weeks: List<String>.from(json["weeks"].map((x) => x)),
        carbos: json["carbos"] == null ? null : json["carbos"],
        fibers: json["fibers"] == null ? null : json["fibers"],
        rating: json["rating"]?.toDouble(),
        country: json["country"] == null ? null : json["country"],
        ratings: json["ratings"] == null ? null : json["ratings"],
        calories: json["calories"] == null ? null : json["calories"],
        headline: json["headline"] == null ? null : json["headline"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        products: List<String>.from(json["products"].map((x) => x)),
        proteins: json["proteins"] == null ? null : json["proteins"],
        favorites: json["favorites"] == null ? null : json["favorites"],
        difficulty: json["difficulty"] == null ? null : json["difficulty"],
        description: json["description"] == null ? null : json["description"],
        highlighted: json["highlighted"] == null ? null : json["highlighted"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        incompatibilities: json["incompatibilities"] == null
            ? null
            : json["incompatibilities"],
        deliverableIngredients:
            List<String>.from(json["deliverable_ingredients"].map((x) => x)),
        undeliverableIngredients:
            List<dynamic>.from(json["undeliverable_ingredients"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fats": fats,
        "name": name,
        "time": time,
        "image": image,
        "weeks": List<dynamic>.from(weeks!.map((x) => x)),
        "carbos": carbos,
        "fibers": fibers,
        "rating": rating,
        "country": country,
        "ratings": ratings,
        "calories": calories,
        "headline": headline,
        "keywords": List<dynamic>.from(keywords!.map((x) => x)),
        "products": List<dynamic>.from(products!.map((x) => x)),
        "proteins": proteins,
        "favorites": favorites,
        "difficulty": difficulty,
        "description": description,
        "highlighted": highlighted,
        "ingredients": List<dynamic>.from(ingredients!.map((x) => x)),
        "incompatibilities": incompatibilities,
        "deliverable_ingredients":
            List<dynamic>.from(deliverableIngredients!.map((x) => x)),
        "undeliverable_ingredients":
            List<dynamic>.from(undeliverableIngredients!.map((x) => x)),
      };
}
