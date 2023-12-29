import 'dart:convert';

class Question {
  final String? title;
  final String? name;
  final String? slug;
  final String? description;
  final QuestionSchema? schema;

  Question({
    this.title,
    this.name,
    this.slug,
    this.description,
    this.schema,
  });

  factory Question.fromRawJson(String str) => Question.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    title: json["title"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    schema: json["schema"] == null ? null : QuestionSchema.fromJson(json["schema"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "name": name,
    "slug": slug,
    "description": description,
    "schema": schema?.toJson(),
  };
}

class QuestionSchema {
  final List<PurpleField>? fields;

  QuestionSchema({
    this.fields,
  });

  factory QuestionSchema.fromRawJson(String str) => QuestionSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionSchema.fromJson(Map<String, dynamic> json) => QuestionSchema(
    fields: json["fields"] == null ? [] : List<PurpleField>.from(json["fields"]!.map((x) => PurpleField.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fields": fields == null ? [] : List<dynamic>.from(fields!.map((x) => x.toJson())),
  };
}

class PurpleField {
  final String? type;
  final int? version;
  final PurpleSchema? schema;

  PurpleField({
    this.type,
    this.version,
    this.schema,
  });

  factory PurpleField.fromRawJson(String str) => PurpleField.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleField.fromJson(Map<String, dynamic> json) => PurpleField(
    type: json["type"],
    version: json["version"],
    schema: json["schema"] == null ? null : PurpleSchema.fromJson(json["schema"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "version": version,
    "schema": schema?.toJson(),
  };
}

class PurpleSchema {
  final String? name;
  final String? label;
  final dynamic hidden;
  final bool? readonly;
  final List<Option>? options;
  final List<FluffyField>? fields;

  PurpleSchema({
    this.name,
    this.label,
    this.hidden,
    this.readonly,
    this.options,
    this.fields,
  });

  factory PurpleSchema.fromRawJson(String str) => PurpleSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleSchema.fromJson(Map<String, dynamic> json) => PurpleSchema(
    name: json["name"],
    label: json["label"],
    hidden: json["hidden"],
    readonly: json["readonly"],
    options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
    fields: json["fields"] == null ? [] : List<FluffyField>.from(json["fields"]!.map((x) => FluffyField.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "label": label,
    "hidden": hidden,
    "readonly": readonly,
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
    "fields": fields == null ? [] : List<dynamic>.from(fields!.map((x) => x.toJson())),
  };
}

class FluffyField {
  final String? type;
  final int? version;
  final FluffySchema? schema;

  FluffyField({
    this.type,
    this.version,
    this.schema,
  });

  factory FluffyField.fromRawJson(String str) => FluffyField.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyField.fromJson(Map<String, dynamic> json) => FluffyField(
    type: json["type"],
    version: json["version"],
    schema: json["schema"] == null ? null : FluffySchema.fromJson(json["schema"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "version": version,
    "schema": schema?.toJson(),
  };
}

class FluffySchema {
  final String? name;
  final String? label;
  final bool? hidden;
  final bool? readonly;
  final List<Option>? options;

  FluffySchema({
    this.name,
    this.label,
    this.hidden,
    this.readonly,
    this.options,
  });

  factory FluffySchema.fromRawJson(String str) => FluffySchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffySchema.fromJson(Map<String, dynamic> json) => FluffySchema(
    name: json["name"],
    label: json["label"],
    hidden: json["hidden"],
    readonly: json["readonly"],
    options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "label": label,
    "hidden": hidden,
    "readonly": readonly,
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
  };
}

class Option {
  final String? key;
  final String? value;

  Option({
    this.key,
    this.value,
  });

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}
