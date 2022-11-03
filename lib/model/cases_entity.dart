// To parse this JSON data, do
//
//     final casesEntity = casesEntityFromJson(jsonString);

import 'dart:convert';

class CasesEntity {
  CasesEntity({
    this.facetCounts,
    this.found,
    this.hits,
    this.outOf,
    this.page,
    this.searchCutoff,
    this.searchTimeMs,
  });

  List<dynamic>? facetCounts;
  int? found;
  List<Hit>? hits;
  int? outOf;
  int? page;
  bool? searchCutoff;
  int? searchTimeMs;

  factory CasesEntity.fromRawJson(String str) => CasesEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CasesEntity.fromJson(Map<String, dynamic> json) => CasesEntity(
    facetCounts: List<dynamic>.from(json["facet_counts"].map((x) => x)),
    found: json["found"],
    hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
    outOf: json["out_of"],
    page: json["page"],
    searchCutoff: json["search_cutoff"],
    searchTimeMs: json["search_time_ms"],
  );

  Map<String, dynamic> toJson() => {
    "facet_counts": List<dynamic>.from(facetCounts!.map((x) => x)),
    "found": found,
    "hits": List<dynamic>.from(hits!.map((x) => x.toJson())),
    "out_of": outOf,
    "page": page,
    "search_cutoff": searchCutoff,
    "search_time_ms": searchTimeMs,
  };
}

class Hit {
  Hit({
    this.document,
    this.textMatch,
  });

  Document? document;
  int? textMatch;

  factory Hit.fromRawJson(String str) => Hit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
    document: Document.fromJson(json["document"]),
    textMatch: json["text_match"],
  );

  Map<String, dynamic> toJson() => {
    "document": document!.toJson(),
    "text_match": textMatch,
  };
}

class Document {
  Document({
    this.date,
    this.filename,
    this.id,
    this.pageStart,
    this.title,
    this.type,
  });

  int? date;
  int? filename;
  String? id;
  int? pageStart;
  String? title;
  Type? type;

  factory Document.fromRawJson(String str) => Document.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    date: json["date"],
    filename: json["filename"],
    id: json["id"],
    pageStart: json["page_start"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "filename": filename,
    "id": id,
    "page_start": pageStart,
    "title": title,
  };
}


