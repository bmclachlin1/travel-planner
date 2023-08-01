import 'package:silvacom_flutter/models/city_model.dart';
import 'package:test/test.dart';

void main() {
  group('CityModel', () {
    test('Deserialize JSON', () {
      const json = <String, dynamic>{
        "id": "ABC123",
        "name": "Calgary",
        "label": "YYC",
        "description": "My hometown",
        "latlong": [51.05, -114.06]
      };
      CityModel calgary = CityModel.fromJson(json);

      expect(calgary.documentId, "ABC123");
      expect(calgary.name, "Calgary");
      expect(calgary.label, "YYC");
      expect(calgary.description, "My hometown");
      expect(calgary.latlong, [51.05, -114.06]);
    });
  });
}
