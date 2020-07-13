class Languages {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Languages({this.name, this.id, this.languageCode, this.flag});

  static List<Languages> languageList() {
    return <Languages>[
      Languages(
//          '🇺🇸', 1, 'English', 'en'
        name: 'English',
        id: 1,
        flag: '🇺🇸',
        languageCode: 'en',
      ),
      Languages(
//          '🇸🇦', 2, 'العربية', 'ar'
        name: 'العربية',
        id: 2,
        languageCode: 'ar',
        flag: '🇸🇦',
      ),
    ];
  }
}
