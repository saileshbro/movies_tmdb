import 'package:movies_tmdb/domain/entities/language_entity.dart';

class Languages {
  const Languages._();
  static const langages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'es', value: 'Spanish'),
  ];
}
