class PornData {
  int? count;
  String? next;
  var previous;
  List<Results>? results;

  PornData({this.count, this.next, this.previous, this.results});

  PornData.fromJson(Map<String?, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  int? age;
  String? dateOfBirth;
  String? nationality;
  String? ethnicity;
  String? eyes;
  String? hair;
  String? height;
  int? heightFt;
  int? heightIn;
  String? weight;
  String? boobs;
  String? ass;
  String? shoeSize;
  String? tats;
  String? piercings;
  String? cupSize;
  String? rawMeasurement;
  int? bust;
  int? waist;
  int? hip;
  String? pornpicsLink;
  String? freeonesLink;
  List<Images> ?images;
  int? rank;
  String? slug;

  Results(
      {this.name,
      this.age,
      this.dateOfBirth,
      this.nationality,
      this.ethnicity,
      this.eyes,
      this.hair,
      this.height,
      this.heightFt,
      this.heightIn,
      this.weight,
      this.boobs,
      this.ass,
      this.shoeSize,
      this.tats,
      this.piercings,
      this.cupSize,
      this.rawMeasurement,
      this.bust,
      this.waist,
      this.hip,
      this.pornpicsLink,
      this.freeonesLink,
      this.images,
      this.rank,
      this.slug});

  Results.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    age = json['age'];
    dateOfBirth = json['date_of_birth'];
    nationality = json['nationality'];
    ethnicity = json['ethnicity'];
    eyes = json['eyes'];
    hair = json['hair'];
    height = json['height'];
    heightFt = json['height_ft'];
    heightIn = json['height_in'];
    weight = json['weight'];
    boobs = json['boobs'];
    ass = json['ass'];
    shoeSize = json['shoe_size'];
    tats = json['tats'];
    piercings = json['piercings'];
    cupSize = json['cup_size'];
    rawMeasurement = json['raw_measurement'];
    bust = json['bust'];
    waist = json['waist'];
    hip = json['hip'];
    pornpicsLink = json['pornpics_link'];
    freeonesLink = json['freeones_link'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    rank = json['rank'];
    slug = json['slug'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['name'] = this.name;
    data['age'] = this.age;
    data['date_of_birth'] = this.dateOfBirth;
    data['nationality'] = this.nationality;
    data['ethnicity'] = this.ethnicity;
    data['eyes'] = this.eyes;
    data['hair'] = this.hair;
    data['height'] = this.height;
    data['height_ft'] = this.heightFt;
    data['height_in'] = this.heightIn;
    data['weight'] = this.weight;
    data['boobs'] = this.boobs;
    data['ass'] = this.ass;
    data['shoe_size'] = this.shoeSize;
    data['tats'] = this.tats;
    data['piercings'] = this.piercings;
    data['cup_size'] = this.cupSize;
    data['raw_measurement'] = this.rawMeasurement;
    data['bust'] = this.bust;
    data['waist'] = this.waist;
    data['hip'] = this.hip;
    data['pornpics_link'] = this.pornpicsLink;
    data['freeones_link'] = this.freeonesLink;
    if (this.images != null) {
      data['images'] = images?.map((v) => v.toJson()).toList();
    }
    data['rank'] = this.rank;
    data['slug'] = this.slug;
    return data;
  }
}

class Images {
  String? imageLink;
  String? image;
  bool? isProfilePic;

  Images({this.imageLink, this.image, this.isProfilePic});

  Images.fromJson(Map<String?, dynamic> json) {
    imageLink = json['image_link'];
    image = json['image'];
    isProfilePic = json['is_profile_pic'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['image_link'] = this.imageLink;
    data['image'] = this.image;
    data['is_profile_pic'] = this.isProfilePic;
    return data;
  }
}
