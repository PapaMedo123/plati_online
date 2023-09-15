import 'dart:convert';

class PlacesApiResults {
    List<dynamic>? htmlAttributions;
    String? nextPageToken;
    List<Result>? results;
    String? status;

    PlacesApiResults({
        this.htmlAttributions,
        this.nextPageToken,
        this.results,
        this.status,
    });

    factory PlacesApiResults.fromRawJson(String str) => PlacesApiResults.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PlacesApiResults.fromJson(Map<String, dynamic> json) => PlacesApiResults(
        htmlAttributions: json["html_attributions"] == null ? [] : List<dynamic>.from(json["html_attributions"]!.map((x) => x)),
        nextPageToken: json["next_page_token"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "html_attributions": htmlAttributions == null ? [] : List<dynamic>.from(htmlAttributions!.map((x) => x)),
        "next_page_token": nextPageToken,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "status": status,
    };
}

class Result {
    Geometry? geometry;
    String? icon;
    IconBackgroundColor? iconBackgroundColor;
    String? iconMaskBaseUri;
    String? name;
    List<Photo>? photos;
    String? placeId;
    String? reference;
    Scope? scope;
    List<String>? types;
    String? vicinity;
    BusinessStatus? businessStatus;
    OpeningHours? openingHours;
    PlusCode? plusCode;
    double? rating;
    int? userRatingsTotal;
    int? priceLevel;
    bool? permanentlyClosed;

    Result({
        this.geometry,
        this.icon,
        this.iconBackgroundColor,
        this.iconMaskBaseUri,
        this.name,
        this.photos,
        this.placeId,
        this.reference,
        this.scope,
        this.types,
        this.vicinity,
        this.businessStatus,
        this.openingHours,
        this.plusCode,
        this.rating,
        this.userRatingsTotal,
        this.priceLevel,
        this.permanentlyClosed,
    });

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        icon: json["icon"],
        iconBackgroundColor: iconBackgroundColorValues.map[json["icon_background_color"]]!,
        iconMaskBaseUri: json["icon_mask_base_uri"],
        name: json["name"],
        photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        placeId: json["place_id"],
        reference: json["reference"],
        scope: scopeValues.map[json["scope"]]!,
        types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
        vicinity: json["vicinity"],
        businessStatus: businessStatusValues.map[json["business_status"]]!,
        openingHours: json["opening_hours"] == null ? null : OpeningHours.fromJson(json["opening_hours"]),
        plusCode: json["plus_code"] == null ? null : PlusCode.fromJson(json["plus_code"]),
        rating: json["rating"]?.toDouble(),
        userRatingsTotal: json["user_ratings_total"],
        priceLevel: json["price_level"],
        permanentlyClosed: json["permanently_closed"],
    );

    Map<String, dynamic> toJson() => {
        "geometry": geometry?.toJson(),
        "icon": icon,
        "icon_background_color": iconBackgroundColorValues.reverse[iconBackgroundColor],
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "place_id": placeId,
        "reference": reference,
        "scope": scopeValues.reverse[scope],
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "vicinity": vicinity,
        "business_status": businessStatusValues.reverse[businessStatus],
        "opening_hours": openingHours?.toJson(),
        "plus_code": plusCode?.toJson(),
        "rating": rating,
        "user_ratings_total": userRatingsTotal,
        "price_level": priceLevel,
        "permanently_closed": permanentlyClosed,
    };
}

enum BusinessStatus {
    CLOSED_TEMPORARILY,
    OPERATIONAL
}

final businessStatusValues = EnumValues({
    "CLOSED_TEMPORARILY": BusinessStatus.CLOSED_TEMPORARILY,
    "OPERATIONAL": BusinessStatus.OPERATIONAL
});

class Geometry {
    LocationJsonData? location;
    Viewport? viewport;

    Geometry({
        this.location,
        this.viewport,
    });

    factory Geometry.fromRawJson(String str) => Geometry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null ? null : LocationJsonData.fromJson(json["location"]),
        viewport: json["viewport"] == null ? null : Viewport.fromJson(json["viewport"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "viewport": viewport?.toJson(),
    };
}

class LocationJsonData {
    double? lat;
    double? lng;

    LocationJsonData({
        this.lat,
        this.lng,
    });

    factory LocationJsonData.fromRawJson(String str) => LocationJsonData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LocationJsonData.fromJson(Map<String, dynamic> json) => LocationJsonData(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Viewport {
    LocationJsonData? northeast;
    LocationJsonData? southwest;

    Viewport({
        this.northeast,
        this.southwest,
    });

    factory Viewport.fromRawJson(String str) => Viewport.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: json["northeast"] == null ? null : LocationJsonData.fromJson(json["northeast"]),
        southwest: json["southwest"] == null ? null : LocationJsonData.fromJson(json["southwest"]),
    );

    Map<String, dynamic> toJson() => {
        "northeast": northeast?.toJson(),
        "southwest": southwest?.toJson(),
    };
}

enum IconBackgroundColor {
    FF9_E67,
    THE_4_B96_F3,
    THE_7_B9_EB0,
    THE_909_CE1
}

final iconBackgroundColorValues = EnumValues({
    "#FF9E67": IconBackgroundColor.FF9_E67,
    "#4B96F3": IconBackgroundColor.THE_4_B96_F3,
    "#7B9EB0": IconBackgroundColor.THE_7_B9_EB0,
    "#909CE1": IconBackgroundColor.THE_909_CE1
});

class OpeningHours {
    bool? openNow;

    OpeningHours({
        this.openNow,
    });

    factory OpeningHours.fromRawJson(String str) => OpeningHours.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"],
    );

    Map<String, dynamic> toJson() => {
        "open_now": openNow,
    };
}

class Photo {
    int? height;
    List<String>? htmlAttributions;
    String? photoReference;
    int? width;

    Photo({
        this.height,
        this.htmlAttributions,
        this.photoReference,
        this.width,
    });

    factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions: json["html_attributions"] == null ? [] : List<String>.from(json["html_attributions"]!.map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": htmlAttributions == null ? [] : List<dynamic>.from(htmlAttributions!.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
    };
}

class PlusCode {
    String? compoundCode;
    String? globalCode;

    PlusCode({
        this.compoundCode,
        this.globalCode,
    });

    factory PlusCode.fromRawJson(String str) => PlusCode.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
    );

    Map<String, dynamic> toJson() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
    };
}

enum Scope {
    GOOGLE
}

final scopeValues = EnumValues({
    "GOOGLE": Scope.GOOGLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
