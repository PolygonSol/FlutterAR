class BridgeDataModel {
  String? objectIdFieldName;
  UniqueIdField? uniqueIdField;
  String? globalIdFieldName;
  String? geometryType;
  SpatialReference? spatialReference;
  List<Fields>? fields;
  List<Features>? features;

  BridgeDataModel(
      {this.objectIdFieldName,
        this.uniqueIdField,
        this.globalIdFieldName,
        this.geometryType,
        this.spatialReference,
        this.fields,
        this.features});

  BridgeDataModel.fromJson(Map<String, dynamic> json) {
    objectIdFieldName = json['objectIdFieldName'];
    uniqueIdField = json['uniqueIdField'] != null
        ? new UniqueIdField.fromJson(json['uniqueIdField'])
        : null;
    globalIdFieldName = json['globalIdFieldName'];
    geometryType = json['geometryType'];
    spatialReference = json['spatialReference'] != null
        ? new SpatialReference.fromJson(json['spatialReference'])
        : null;
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(new Fields.fromJson(v));
      });
    }
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectIdFieldName'] = this.objectIdFieldName;
    if (this.uniqueIdField != null) {
      data['uniqueIdField'] = this.uniqueIdField!.toJson();
    }
    data['globalIdFieldName'] = this.globalIdFieldName;
    data['geometryType'] = this.geometryType;
    if (this.spatialReference != null) {
      data['spatialReference'] = this.spatialReference!.toJson();
    }
    if (this.fields != null) {
      data['fields'] = this.fields!.map((v) => v.toJson()).toList();
    }
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UniqueIdField {
  String? name;
  bool? isSystemMaintained;

  UniqueIdField({this.name, this.isSystemMaintained});

  UniqueIdField.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isSystemMaintained = json['isSystemMaintained'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isSystemMaintained'] = this.isSystemMaintained;
    return data;
  }
}

class SpatialReference {
  int? wkid;
  int? latestWkid;

  SpatialReference({this.wkid, this.latestWkid});

  SpatialReference.fromJson(Map<String, dynamic> json) {
    wkid = json['wkid'];
    latestWkid = json['latestWkid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wkid'] = this.wkid;
    data['latestWkid'] = this.latestWkid;
    return data;
  }
}

class Fields {
  String? name;
  String? type;
  String? alias;
  String? sqlType;
  int? length;
  Null? domain;
  Null? defaultValue;

  Fields(
      {this.name,
        this.type,
        this.alias,
        this.sqlType,
        this.length,
        this.domain,
        this.defaultValue});

  Fields.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    alias = json['alias'];
    sqlType = json['sqlType'];
    length = json['length'];
    domain = json['domain'];
    defaultValue = json['defaultValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['alias'] = this.alias;
    data['sqlType'] = this.sqlType;
    data['length'] = this.length;
    data['domain'] = this.domain;
    data['defaultValue'] = this.defaultValue;
    return data;
  }
}

class Features {
  Attributes? attributes;
  Geometry? geometry;

  Features({this.attributes, this.geometry});

  Features.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? rECORDTYPE005A;
  String? rOUTENUMBER005D;
  String? nAVIGATION038;
  double? lATDD;
  double? lONGDD;
  String? sTATECODE001;
  String? pLACECODE004;
  String? sTRUCTURENUMBER008;

  Attributes(
      {this.rECORDTYPE005A,
        this.rOUTENUMBER005D,
        this.nAVIGATION038,
        this.lATDD,
        this.lONGDD,
        this.sTATECODE001,
        this.pLACECODE004,
        this.sTRUCTURENUMBER008});

  Attributes.fromJson(Map<String, dynamic> json) {
    rECORDTYPE005A = json['RECORD_TYPE_005A'];
    rOUTENUMBER005D = json['ROUTE_NUMBER_005D'];
    nAVIGATION038 = json['NAVIGATION_038'];
    lATDD = json['LATDD'];
    lONGDD = json['LONGDD'];
    sTATECODE001 = json['STATE_CODE_001'];
    pLACECODE004 = json['PLACE_CODE_004'];
    sTRUCTURENUMBER008 = json['STRUCTURE_NUMBER_008'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RECORD_TYPE_005A'] = this.rECORDTYPE005A;
    data['ROUTE_NUMBER_005D'] = this.rOUTENUMBER005D;
    data['NAVIGATION_038'] = this.nAVIGATION038;
    data['LATDD'] = this.lATDD;
    data['LONGDD'] = this.lONGDD;
    data['STATE_CODE_001'] = this.sTATECODE001;
    data['PLACE_CODE_004'] = this.pLACECODE004;
    data['STRUCTURE_NUMBER_008'] = this.sTRUCTURENUMBER008;
    return data;
  }
}

class Geometry {
  double? x;
  double? y;

  Geometry({this.x, this.y});

  Geometry.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
