import 'package:sticker_app/models/OpenFoodFacts/Sizes.dart';

class NutritionFr {
  String y1;
  String normalize;
  String x2;
  String rev;
  String geometry;
  Sizes sizes;
  String y2;
  String x1;
  String angle;
  String whiteMagic;
  String imgid;

  NutritionFr(
      {this.y1,
        this.normalize,
        this.x2,
        this.rev,
        this.geometry,
        this.sizes,
        this.y2,
        this.x1,
        this.angle,
        this.whiteMagic,
        this.imgid});

  NutritionFr.fromJson(Map<String, dynamic> json) {
    y1 = json.containsKey('y1') == true
        ? json['y1'].toString()
        : null;
    normalize = json.containsKey('normalize') == true
        ? json['normalize'].toString()
        : null;
    x2 = json.containsKey('x2') == true
        ? json['x2'].toString()
        : null;
    rev = json.containsKey('rev') == true
        ? json['rev'].toString()
        : null;
    geometry = json.containsKey('geometry') == true
        ? json['geometry'].toString()
        : null;
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
    y2 = json.containsKey('y2') == true
        ? json['y2'].toString()
        : null;
    x1 = json.containsKey('x1') == true
        ? json['x1'].toString()
        : null;
    angle = json.containsKey('angle') == true
        ? json['angle'].toString()
        : null;
    whiteMagic = json.containsKey('whiteMagic') == true
        ? json['whiteMagic'].toString()
        : null;
    imgid = json.containsKey('imgid') == true
        ? json['imgid'].toString()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['y1'] = this.y1;
    data['normalize'] = this.normalize;
    data['x2'] = this.x2;
    data['rev'] = this.rev;
    data['geometry'] = this.geometry;
    if (this.sizes != null) {
      data['sizes'] = this.sizes.toJson();
    }
    data['y2'] = this.y2;
    data['x1'] = this.x1;
    data['angle'] = this.angle;
    data['white_magic'] = this.whiteMagic;
    data['imgid'] = this.imgid;
    return data;
  }

  @override
  String toString() {
    return 'NutritionFr{y1: $y1, normalize: $normalize, x2: $x2, rev: $rev, geometry: $geometry, sizes: $sizes, y2: $y2, x1: $x1, angle: $angle, whiteMagic: $whiteMagic, imgid: $imgid}';
  }
}