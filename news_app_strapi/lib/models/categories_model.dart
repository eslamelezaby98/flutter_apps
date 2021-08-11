import 'dart:convert';

List<CategoriesModel> categoriesApiFromJson(String str) => List<CategoriesModel>.from(json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesApiToJson(List<CategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
    CategoriesModel({
        this.id,
        this.nameCategory,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.imageCategory,
        this.articles,
    });

    int id;
    String nameCategory;
    AtedBy createdBy;
    AtedBy updatedBy;
    DateTime createdAt;
    DateTime updatedAt;
    Image imageCategory;
    List<Article> articles;

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        id: json["id"],
        nameCategory: json["name_category"],
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: AtedBy.fromJson(json["updated_by"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageCategory: Image.fromJson(json["image_category"]),
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_category": nameCategory,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image_category": imageCategory.toJson(),
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        this.id,
        this.titleArticle,
        this.sourceArticle,
        this.descriptionArticle,
        this.urlArticle,
        this.publishAt,
        this.contentArticle,
        this.category,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.imageArticle,
    });

    int id;
    String titleArticle;
    String sourceArticle;
    String descriptionArticle;
    String urlArticle;
    DateTime publishAt;
    String contentArticle;
    int category;
    int createdBy;
    int updatedBy;
    DateTime createdAt;
    DateTime updatedAt;
    Image imageArticle;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        titleArticle: json["title_article"],
        sourceArticle: json["source_article"],
        descriptionArticle: json["description_article"],
        urlArticle: json["url_article"],
        publishAt: DateTime.parse(json["publish_at"]),
        contentArticle: json["content_article"],
        category: json["category"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageArticle: Image.fromJson(json["image_article"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title_article": titleArticle,
        "source_article": sourceArticle,
        "description_article": descriptionArticle,
        "url_article": urlArticle,
        "publish_at": "${publishAt.year.toString().padLeft(4, '0')}-${publishAt.month.toString().padLeft(2, '0')}-${publishAt.day.toString().padLeft(2, '0')}",
        "content_article": contentArticle,
        "category": category,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image_article": imageArticle.toJson(),
    };
}

class Image {
    Image({
        this.id,
        this.name,
        this.alternativeText,
        this.caption,
        this.width,
        this.height,
        this.formats,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.url,
        this.previewUrl,
        this.provider,
        this.providerMetadata,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String alternativeText;
    String caption;
    int width;
    int height;
    Formats formats;
    String hash;
    Ext ext;
    Mime mime;
    double size;
    String url;
    dynamic previewUrl;
    Provider provider;
    dynamic providerMetadata;
    int createdBy;
    int updatedBy;
    DateTime createdAt;
    DateTime updatedAt;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: extValues.map[json["ext"]],
        mime: mimeValues.map[json["mime"]],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: providerValues.map[json["provider"]],
        providerMetadata: json["provider_metadata"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats.toJson(),
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": providerValues.reverse[provider],
        "provider_metadata": providerMetadata,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum Ext { JPG, EMPTY }

final extValues = EnumValues({
    "": Ext.EMPTY,
    ".jpg": Ext.JPG
});

class Formats {
    Formats({
        this.thumbnail,
        this.medium,
        this.small,
        this.large,
    });

    Thumbnail thumbnail;
    Thumbnail medium;
    Thumbnail small;
    Thumbnail large;

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        medium: json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
        small: json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
        large: json["large"] == null ? null : Thumbnail.fromJson(json["large"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "medium": medium == null ? null : medium.toJson(),
        "small": small == null ? null : small.toJson(),
        "large": large == null ? null : large.toJson(),
    };
}

class Thumbnail {
    Thumbnail({
        this.name,
        this.hash,
        this.ext,
        this.mime,
        this.width,
        this.height,
        this.size,
        this.path,
        this.url,
    });

    String name;
    String hash;
    Ext ext;
    Mime mime;
    int width;
    int height;
    double size;
    dynamic path;
    String url;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        name: json["name"],
        hash: json["hash"],
        ext: extValues.map[json["ext"]],
        mime: mimeValues.map[json["mime"]],
        width: json["width"],
        height: json["height"],
        size: json["size"].toDouble(),
        path: json["path"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "width": width,
        "height": height,
        "size": size,
        "path": path,
        "url": url,
    };
}

enum Mime { IMAGE_JPEG }

final mimeValues = EnumValues({
    "image/jpeg": Mime.IMAGE_JPEG
});

enum Provider { LOCAL }

final providerValues = EnumValues({
    "local": Provider.LOCAL
});

class AtedBy {
    AtedBy({
        this.id,
        this.firstname,
        this.lastname,
        this.username,
    });

    int id;
    String firstname;
    String lastname;
    dynamic username;

    factory AtedBy.fromJson(Map<String, dynamic> json) => AtedBy(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
