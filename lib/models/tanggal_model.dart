class TanggalModel {
    TanggalModel({
        required this.date,
        required this.timezoneType,
        required this.timezone,
    });

    DateTime date;
    int timezoneType;
    String timezone;

    factory TanggalModel.fromJson(Map<String, dynamic> json) => TanggalModel(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"] == null ? null : json["timezone_type"],
        timezone: json["timezone"] == null ? null : json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "date": date == null ? null : date.toIso8601String(),
        "timezone_type": timezoneType == null ? null : timezoneType,
        "timezone": timezone == null ? null : timezone,
    };
}
