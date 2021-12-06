const String arabic = 'arabic';
const String english = 'english';

enum LaguageType { arabic, english }

extension LaguageTypeExtension on LaguageType {
  String getValue() {
    switch (this) {
      case LaguageType.arabic:
        return arabic;
      case LaguageType.english:
        return english;
    }
  }
}
