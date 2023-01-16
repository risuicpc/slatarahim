class Profile {
  final int id;
  final String name;
  final int father;
  final int mother;
  final String address;
  final String gender;
  final String phone;

  Profile(
    this.id,
    this.name,
    this.father,
    this.mother,
    this.address,
    this.gender,
    this.phone,
  );

  static List<Profile> familyList() {
    return <Profile>[
      Profile(1, "debalo", 0, 0, "", "", ""),
      Profile(2, "yesaliyaEndet", 0, 0, "", "", ""),
      Profile(4, "yemohammedEndet", 0, 0, "", "", ""),
      Profile(8, "yeredyEndet", 0, 0, "", "", ""),
      Profile(9, "yorkichoEndet", 0, 0, "", "", ""),
      Profile(10, "medinaMshira", 0, 0, "", "", ""),
      Profile(24, "shewbo", 0, 0, "", "", ""),
      Profile(25, "yeabdiEndet", 0, 0, "", "", ""),
      Profile(34, "ayriyaSiraj", 0, 0, "", "", ""),
      Profile(42, "jemilaRedi", 0, 0, "", "", ""),
      Profile(44, "awelShukur", 0, 0, "", "", ""),
      Profile(48, "mehbuba", 0, 0, "", "", ""),
      Profile(50, "nefisaSheman", 0, 0, "", "", ""),
      Profile(59, "alewiya", 0, 0, "", "", ""),
      Profile(62, "yesin", 0, 0, "", "", ""),
      Profile(64, "zeyneba", 0, 0, "", "", ""),
      Profile(66, "nudo", 0, 0, "", "", ""),
      Profile(75, "behreSurur", 0, 0, "", "", ""),
      Profile(79, "zulfaNuri", 0, 0, "", "", ""),
      Profile(84, "shemsiyaTemam", 0, 0, "", "", ""),
      Profile(91, "megfiraNesir", 0, 0, "", "", ""),
      Profile(93, "ziyeda", 0, 0, "", "", ""),
      Profile(95, "jemilaAbdela", 0, 0, "", "", ""),
      Profile(97, "abrarSheali", 0, 0, "", "", ""),
      Profile(103, "shemsiyaLalo", 0, 0, "", "", ""),
      Profile(107, "mohammed", 0, 0, "", "", ""),
      Profile(109, "kiyarSiraj", 0, 0, "", "", ""),
      Profile(117, "shewmolo", 0, 0, "", "", ""),
      Profile(121, "ademAwol", 0, 0, "", "", ""),
      Profile(128, "abduremanAsrar", 0, 0, "", "", ""),
      Profile(131, "behreRedi", 0, 0, "", "", ""),
      Profile(132, "siyd", 0, 0, "", "", ""),
      Profile(137, "heyatuDeri", 0, 0, "", "", ""),
      Profile(139, "yesulalaEndet", 0, 0, "", "", ""),
      // childrens of debalo
      Profile(3, "saliya", 1, 2, "alsisNigdibr", "male", ""),
      // childrens of saliy
      Profile(5, "mohammed", 3, 4, "alsisNigdibr", "male", ""),
      Profile(6, "abdo", 3, 4, "ashkokele", "male", ""),
      Profile(7, "sheHessan", 3, 4, "sirt", "male", ""),
      // childrens of mohammed
      Profile(11, "redi", 5, 8, "alsisNigdibr", "male", ""),
      Profile(12, "zehra", 5, 8, "kala", "female", ""),
      Profile(13, "shifo", 5, 8, "nigdibr", "female", ""),
      Profile(14, "sheKedir", 5, 8, "alsisNigdibr", "male", ""),
      Profile(15, "usman", 5, 8, "alsisNigdibr", "male", ""),
      Profile(16, "zeyda", 5, 8, "kala", "female", ""),
      Profile(17, "shukra", 5, 8, "alkeso", "female", ""),
      Profile(18, "nuriya", 5, 10, "aybat", "female", ""),
      Profile(19, "werqicho", 5, 9, "addisAbaba", "male", "+251912879763"),
      Profile(20, "kamil", 5, 10, "alsisNigdibr", "male", ""),
      Profile(21, "kedija", 5, 9, "ansewa", "female", ""),
      Profile(22, "keyria", 5, 10, "alsis", "female", ""),
      Profile(23, "zeyne", 5, 10, "addisAbaba", "male", "+251944307404"),
      // children of redi
      Profile(26, "denur", 11, 24, "alsisNigdibr", "male", "+251948434817"),
      Profile(27, "sheSirej", 11, 24, "senkura", "male", "+251938034299"),
      Profile(28, "jemal", 11, 24, "alsisNigdibr", "male", ""),
      Profile(29, "abdulkerim", 11, 25, "addisAbaba", "male", ""),
      Profile(30, "ali", 11, 25, "addisAbaba", "male", ""),
      Profile(31, "fetiya", 11, 24, "danecho", "female", ""),
      Profile(32, "ruqiya", 11, 24, "alsisNigdibr", "female", "+251936448745"),
      Profile(33, "zemzo", 11, 24, "wenji", "female", ""),
      // children of denur
      Profile(35, "merdiya", 26, 34, "anshebeso", "female", ""),
      Profile(36, "abdulhafiz", 26, 34, "addisAbaba", "male", "+251943801414"),
      Profile(37, "abdulnesir", 26, 34, "adama", "male", "+251944251400"),
      Profile(38, "merema", 26, 34, "addisAbaba", "female", "+251952952464"),
      Profile(39, "neja", 26, 34, "alsisNigdibr", "male", ""),
      Profile(40, "sefiya", 26, 34, "alsisNigdibr", "female", ""),
      Profile(41, "seifu", 26, 34, "alsisNigdibr", "male", ""),
      // children of jemal
      Profile(43, "jelaludin", 28, 42, "alsisNigdibr", "male", ""),
      // children of ruqiya
      Profile(45, "ashreqa", 44, 32, "addisAbaba", "female", ""),
      Profile(46, "kedir", 44, 32, "addisAbaba", "male", "+251968045359"),
      Profile(47, "mohammed", 44, 32, "alsisNigdibr", "male", ""),
      Profile(94, "ayshe", 44, 32, "alsisNigdibr", "male", ""),
      // children of abdulhafiz
      Profile(49, "muaz", 36, 48, "addisAbaba", "male", ""),
      // children of sheKedir
      Profile(51, "abdulkerim", 14, 50, "addisAbaba", "male", "+251912837544"),
      Profile(52, "asiya", 14, 50, "mito", "female", ""),
      Profile(53, "fakiya", 14, 50, "aybat", "female", ""),
      Profile(55, "kesim", 14, 50, "alkeso", "male", "+251980140152"),
      Profile(56, "mekiya", 14, 50, "alicho", "female", ""),
      Profile(57, "ishaq", 14, 50, "addisAbaba", "male", "+251909605795"),
      Profile(58, "shekir", 14, 50, "alsisNigdibr", "male", ""),
      // children of abdulkerim
      Profile(60, "abubeker", 51, 59, "addisAbaba", "male", ""),
      Profile(61, "imran", 51, 59, "addisAbaba", "male", ""),
      Profile(136, "hesinat", 51, 59, "addisAbaba", "female", ""),
      // children of asiya
      Profile(63, "neja", 62, 52, "mito", "male", ""),
      // children of asiya
      Profile(65, "selehadin", 55, 64, "alkeso", "male", ""),
      // children of usman 13 66
      Profile(67, "feyza", 15, 66, "alsisNigdibr", "female", ""),
      Profile(68, "ezedin", 15, 66, "addisAbaba", "male", "+251921811806"),
      Profile(69, "nesre", 15, 66, "addisAbaba", "male", ""),
      Profile(70, "jemal", 15, 66, "addisAbaba", "male", "+251920649939"),
      Profile(71, "fejru", 15, 66, "addisAbaba", "male", "+251986966551"),
      Profile(72, "sejida", 15, 66, "addisAbaba", "female", ""),
      Profile(73, "temima", 15, 66, "addisAbaba", "female", ""),
      Profile(74, "rebiya", 15, 66, "alsisNigdibr", "female", ""),
      // children of feyze
      Profile(77, "sheyte", 67, 75, "alsisNigdibr", "female", ""),
      // children of ezedin
      Profile(78, "siham", 68, 95, "addisAbaba", "female", ""),
      // children of werqicho
      Profile(80, "ajiba", 19, 79, "addisAbaba", "female", ""),
      Profile(81, "shemse", 19, 79, "addisAbaba", "male", "+251944201301"),
      Profile(82, "alima", 19, 79, "addisAbaba", "female", ""),
      Profile(83, "mustefa", 19, 79, "alsisNigdibr", "male", ""),
      Profile(76, "selman", 19, 79, "alsisNigdibr", "male", ""),
      // children of kamil
      Profile(85, "mustefa", 17, 84, "addisAbaba", "male", "+251934739566"),
      Profile(86, "sebehadin", 17, 84, "yebu", "male", "+251961425168"),
      Profile(87, "semira", 17, 84, "alkeso", "female", "+251941577264"),
      Profile(88, "fedil", 17, 84, "alkeso", "male", "+251976005267"),
      Profile(89, "hikma", 17, 84, "alsisNigdibr", "female", ""),
      Profile(90, "sewda", 17, 84, "alsisNigdibr", "female", ""),
      // children of mustefa
      Profile(92, "mohammed", 85, 91, "addisAbaba", "male", ""),
      // children of zeyne
      Profile(96, "khelid", 23, 93, "addisAbaba", "male", ""),
      // children of shifo
      Profile(98, "usen", 97, 13, "nigdibr", "male", ""),
      Profile(
          99, "sheMohammedNur", 97, 13, "metahara", "male", "+251912716650"),
      Profile(100, "fadila", 97, 13, "anshebeso", "female", ""),
      Profile(101, "kedir", 97, 13, "nigdibr", "male", ""),
      Profile(102, "behriya", 97, 13, "aybat", "female", ""),
      // children of usen
      Profile(104, "shemima", 98, 103, "addisAbaba", "female", ""),
      Profile(105, "ridwen", 98, 103, "addisAbaba", "male", ""),
      Profile(106, "neja", 98, 103, "addisAbaba", "male", ""),
      // children of fadila
      Profile(108, "kezina", 107, 100, "alkeso", "female", ""),
      // children of shukra
      Profile(110, "zebiba", 109, 20, "addisAbaba", "female", ""),
      Profile(111, "sebehadin", 109, 20, "addisAbaba", "male", ""),
      Profile(112, "nesriya", 109, 20, "addisAbaba", "female", ""),
      Profile(113, "sebla", 109, 20, "addisAbaba", "female", ""),
      Profile(114, "semiya", 109, 20, "alkeso", "female", ""),
      Profile(115, "seyfu", 109, 20, "addisAbaba", "male", "+251919831316"),
      Profile(116, "mohammed", 109, 20, "alkeso", "male", ""),
      // children of kedija
      Profile(118, "sufiya", 117, 21, "addisAbaba", "female", ""),
      Profile(119, "zehra", 117, 21, "addisAbaba", "female", ""),
      Profile(120, "ayshe", 117, 21, "addisAbaba", "female", ""),
      // children of nuriya
      Profile(122, "shemsiya", 121, 18, "alkeso", "female", ""),
      Profile(123, "abdilsemed", 121, 18, "addisAbaba", "male", ""),
      Profile(124, "wesila", 121, 18, "addisAbaba", "female", ""),
      Profile(125, "fejru", 121, 18, "addisAbaba", "male", ""),
      Profile(126, "jemal", 121, 18, "addisAbaba", "male", ""),
      Profile(127, "fuad", 121, 18, "aybat", "male", ""),
      // children of shemsiya
      Profile(135, "tesnim", 137, 122, "alkeso", "female", ""),
      // children of wesila
      Profile(129, "reyan", 128, 124, "addisAbaba", "male", ""),
      Profile(130, "hesinat", 128, 124, "addisAbaba", "female", ""),
      // children of keyria
      Profile(133, "meymuna", 132, 22, "worabe", "female", ""),
      Profile(134, "keshfu", 131, 22, "addisAbaba", "male", "+251949153033"),
      Profile(138, "jezira", 131, 22, "alkeso", "female", ""),
      // children of abdo
      Profile(140, "sulela", 6, 139, "ashkokele", "male", "+251926197170"),
    ];
  }
}
