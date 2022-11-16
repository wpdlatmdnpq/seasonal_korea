class Code {
  int cd;
  String nm;

  Code(this.cd, this.nm);
}

// List<Code> NaviItem = [
//   Code(0, 'home'),
//   Code(1, 'favorite'),
//   Code(2, 'profile')
// ];

enum NaviItem { home, favorite, profile }
List<Code> FilterItem = [
  Code(0, 'all'),
  Code(1, 'spring'),
  Code(2, 'summer'),
  Code(3, 'autumn'),
  Code(4, 'winter'),
];
List<Code> TripType = [
  Code(0, 'one day'),
  Code(1, 'over two day'),
];
