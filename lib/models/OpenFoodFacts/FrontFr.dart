import 'package:sticker_app/models/OpenFoodFacts/Sizes.dart';

class FrontFr {
  String y2;
  String x1;
  String angle;
  String imgid;
  String whiteMagic;
  String x2;
  String normalize;
  String y1;
  String rev;
  String geometry;
  Sizes sizes;

  FrontFr(
      {this.y2,
      this.x1,
      this.angle,
      this.imgid,
      this.whiteMagic,
      this.x2,
      this.normalize,
      this.y1,
      this.rev,
      this.geometry,
      this.sizes});

  FrontFr.fromJson(Map<String, dynamic> json) {
    y2 = json.containsKey('y2') == true ? json['y2'].toString() : null;
    x1 = json.containsKey('x1') == true ? json['x1'].toString() : null;
    angle = json.containsKey('angle') == true
        ? json['angle'] is String ? json['angle'] : json['angle'].toString()
        : null;
    imgid = json.containsKey('imgid') == true ? json['imgid'].toString() : null;
    whiteMagic = json.containsKey('white_magic') == true ? json['white_magic'].toString() : null;
    x2 = json.containsKey('x2') == true ? json['x2'].toString() : null;
    normalize = json.containsKey('normalize') == true ? json['normalize'].toString() : null;
    y1 = json.containsKey('y1') == true ? json['y1'].toString() : null;
    rev = json.containsKey('rev') == true ? json['rev'].toString() : null;
    geometry = json.containsKey('geometry') == true ? json['geometry'].toString() : null;
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['y2'] = this.y2;
    data['x1'] = this.x1;
    data['angle'] = this.angle;
    data['imgid'] = this.imgid;
    data['white_magic'] = this.whiteMagic;
    data['x2'] = this.x2;
    data['normalize'] = this.normalize;
    data['y1'] = this.y1;
    data['rev'] = this.rev;
    data['geometry'] = this.geometry;
    if (this.sizes != null) {
      data['sizes'] = this.sizes.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'FrontFr{y2: $y2, x1: $x1, angle: $angle, imgid: $imgid, whiteMagic: $whiteMagic, x2: $x2, normalize: $normalize, y1: $y1, rev: $rev, geometry: $geometry, sizes: $sizes}';
  }
}
