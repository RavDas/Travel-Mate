import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'si'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? siText = '',
  }) =>
      [enText, siText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '571wn562': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // SearchResultsPage
  {
    '2is4i0pc': {
      'en': 'Search',
      'si': 'සෙවීම',
    },
    'fm71fsio': {
      'en': 'Search everything',
      'si': 'සියල්ල සොයන්න',
    },
    '02qu93tv': {
      'en': 'Open : ',
      'si': 'විවෘත :',
    },
    '8tod8zqa': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // RestaurantPage
  {
    'kh8vr7t5': {
      'en': 'Name',
      'si': 'නම',
    },
    'tro1wdxn': {
      'en': 'Address',
      'si': 'ලිපිනය',
    },
    'odl1o4sl': {
      'en': 'Open',
      'si': 'විවෘත',
    },
    'bmohjiip': {
      'en': 'Accesion Number',
      'si': 'ප්රවේශ අංකය',
    },
    's37newqj': {
      'en': 'View on Met Website',
      'si': 'Met වෙබ් අඩවියේ බලන්න',
    },
    '0samy2mr': {
      'en': 'Add to Collection',
      'si': 'එකතුවට එකතු කරන්න',
    },
    'ajmyot6f': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // LoginPage
  {
    'ujzgi6ur': {
      'en': 'Email',
      'si': 'විද්යුත් තැපෑල',
    },
    'ru45o886': {
      'en': 'Password',
      'si': 'මුරපදය',
    },
    'vf2xwxta': {
      'en': 'Sign in with email',
      'si': 'විද්‍යුත් තැපෑලෙන් පුරන්න',
    },
    '3li1j5x3': {
      'en': 'Create Account',
      'si': 'ගිණුම තනන්න',
    },
    'yw3l6v73': {
      'en': 'Continue as Guest',
      'si': 'ආගන්තුකයෙකු ලෙස ඉදිරියට යන්න',
    },
    '0hmt3vgf': {
      'en': 'Sign in with Google',
      'si': 'Google සමඟින් පුරනය වන්න',
    },
    'o9py8cf0': {
      'en': 'Sign in with Apple',
      'si': 'Apple සමඟ පුරනය වන්න',
    },
    'dlsn3ttx': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // MyCollection
  {
    'd1k6esya': {
      'en': 'My Collection',
      'si': 'මගේ එකතුව',
    },
    'swpf35id': {
      'en': 'Logout',
      'si': 'පිටවීම',
    },
    'gfzfltzj': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // CreateAccountPage
  {
    '7pkhdmea': {
      'en': 'Email',
      'si': 'විද්යුත් තැපෑල',
    },
    'uic171p7': {
      'en': 'Password',
      'si': 'මුරපදය',
    },
    '6alb4pdp': {
      'en': 'Create Account',
      'si': 'ගිණුම තනන්න',
    },
    'tdiwagl2': {
      'en': 'Already have an account?',
      'si': 'දැනටමත් ගිණුමක් තිබේද?',
    },
    '4igopfjf': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // List17Notifications
  {
    'viwcl8od': {
      'en': 'Friend Request',
      'si': 'මිතුරු ඉල්ලීම',
    },
    'lqmutl3o': {
      'en': 'John Smith has requested to be friends.',
      'si': 'ජෝන් ස්මිත් මිතුරන් වීමට ඉල්ලා ඇත.',
    },
    '9y3ipq00': {
      'en': 'Haily Brown',
      'si': 'හේලි බ්‍රවුන්',
    },
    'ado3ydx2': {
      'en': '@brownisthenewblack',
      'si': '@brownisthenewblack',
    },
    'lga5sdla': {
      'en': '2 hours ago',
      'si': 'පැය 2 කට පෙර',
    },
    'iztqt3y2': {
      'en': 'Friend Request',
      'si': 'මිතුරු ඉල්ලීම',
    },
    'blfic3cp': {
      'en': 'John Smith has requested to be friends.',
      'si': 'ජෝන් ස්මිත් මිතුරන් වීමට ඉල්ලා ඇත.',
    },
    'ahuawvp1': {
      'en': 'John Smith',
      'si': 'ජෝන් ස්මිත්',
    },
    '7johsbab': {
      'en': '@johnsmithly',
      'si': '@ජෝන්ස්මිත්ලි',
    },
    '6ddkejvc': {
      'en': '2 hours ago',
      'si': 'පැය 2 කට පෙර',
    },
    'nwipnkz4': {
      'en': 'New Comment!',
      'si': 'නව අදහස!',
    },
    'uw5c0375': {
      'en': '\"You are so awesome! Keep it up!\"',
      'si': '\"ඔයා හරිම නියමයි! දිගටම කරගෙන යන්න!\"',
    },
    'rd3nx9gy': {
      'en': '2 hours ago',
      'si': 'පැය 2 කට පෙර',
    },
    'ww6i1x9q': {
      'en': 'New Like!',
      'si': 'අලුත් Like!',
    },
    '0wzvbsqw': {
      'en': 'You have a new like from John Smith.',
      'si': 'ඔබට ජෝන් ස්මිත්ගෙන් නව කැමැත්තක් ඇත.',
    },
    'dhnbvpw1': {
      'en': '2 hours ago',
      'si': 'පැය 2 කට පෙර',
    },
    'qjkwt1jh': {
      'en': 'Notifications',
      'si': 'දැනුම්දීම්',
    },
    'z354azbn': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // List13PropertyListview
  {
    'm4om6ttt': {
      'en': 'Search listings...',
      'si': 'ලැයිස්තු සොයන්න...',
    },
    'unkk8xm1': {
      'en': 'Homes',
      'si': 'නිවාස',
    },
    'zqktuvgr': {
      'en': 'Maidstone, San Antonio, Tx.',
      'si': 'Maidstone, San Antonio, Tx.',
    },
    '8l803ml3': {
      'en': '\$210/night',
      'si': '\$210/රාත්‍රිය',
    },
    'keiim9a1': {
      'en': '32 miles away',
      'si': '32 ක් දුරින්',
    },
    'masstiky': {
      'en': '4.25',
      'si': '4.25',
    },
    'hvtqp6ch': {
      'en': 'Maidstone, San Antonio, Tx.',
      'si': 'Maidstone, San Antonio, Tx.',
    },
    'k3vpoo3v': {
      'en': '\$210/night',
      'si': '\$210/රාත්‍රිය',
    },
    'xuhibi9o': {
      'en': '32 miles away',
      'si': '32 ක් දුරින්',
    },
    'zxoxe5e5': {
      'en': '4.25',
      'si': '4.25',
    },
    'wyxtw71c': {
      'en': 'Beachfront',
      'si': 'වෙරළ තීරය',
    },
    'nbv0znko': {
      'en': 'Maidstone, San Antonio, Tx.',
      'si': 'Maidstone, San Antonio, Tx.',
    },
    'bgq7mci0': {
      'en': '\$210/night',
      'si': '\$210/රාත්‍රිය',
    },
    'shhmfgzi': {
      'en': '32 miles away',
      'si': '32 ක් දුරින්',
    },
    '00z63ef8': {
      'en': '4.25',
      'si': '4.25',
    },
    'xq2pmegt': {
      'en': 'Maidstone, San Antonio, Tx.',
      'si': 'Maidstone, San Antonio, Tx.',
    },
    'bpmk17gq': {
      'en': '\$210/night',
      'si': '\$210/රාත්‍රිය',
    },
    'c6uc8joy': {
      'en': '32 miles away',
      'si': '32 ක් දුරින්',
    },
    'qmlll61m': {
      'en': '4.25',
      'si': '4.25',
    },
    'qf2v3jnr': {
      'en': 'Nature',
      'si': 'ස්වභාවය',
    },
    'c76vyznl': {
      'en': 'Maidstone, San Antonio, Tx.',
      'si': 'Maidstone, San Antonio, Tx.',
    },
    'ty6sdxb5': {
      'en': '\$210/night',
      'si': '\$210/රාත්‍රිය',
    },
    'a5r3dslt': {
      'en': '32 miles away',
      'si': '32 ක් දුරින්',
    },
    '6u6bevdg': {
      'en': '4.25',
      'si': '4.25',
    },
    'kr57c3jr': {
      'en': 'Maidstone, San Antonio, Tx.',
      'si': 'Maidstone, San Antonio, Tx.',
    },
    '0lf1tsgs': {
      'en': '\$210/night',
      'si': '\$210/රාත්‍රිය',
    },
    'a7zqdyrz': {
      'en': '32 miles away',
      'si': '32 ක් දුරින්',
    },
    'ilybfwq2': {
      'en': '4.25',
      'si': '4.25',
    },
    'vhazzxv8': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // Details09Reviews
  {
    'xy9srtv0': {
      'en': '2,503',
      'si': '2,503 කි',
    },
    'rcnac9dn': {
      'en': '# of Ratings',
      'si': 'ශ්‍රේණිගත කිරීම් #',
    },
    'lmmc2wxm': {
      'en': '4.6',
      'si': '4.6',
    },
    'xzempy9k': {
      'en': 'Avg. Rating',
      'si': 'සාමාන්‍ය ශ්රේණිගත කිරීම',
    },
    'wkazizsz': {
      'en': 'Vacation Home',
      'si': 'නිවාඩු නිකේතනය',
    },
    'vyhgo5ay': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'si':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt Ut labour සහ dolore magna aliqua.',
    },
    'a3f2dpbx': {
      'en': 'Vacation Home',
      'si': 'නිවාඩු නිකේතනය',
    },
    '7oy633sl': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'si':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt Ut labour සහ dolore magna aliqua.',
    },
    '7je3y9ec': {
      'en': 'Vacation Home',
      'si': 'නිවාඩු නිකේතනය',
    },
    '4g8y56nt': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'si':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt Ut labour සහ dolore magna aliqua.',
    },
    'dtnaac49': {
      'en': 'Vacation Home',
      'si': 'නිවාඩු නිකේතනය',
    },
    '3jx9k10f': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'si':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt Ut labour සහ dolore magna aliqua.',
    },
    'hskuewf9': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // Home15Travel
  {
    'dx84ob9o': {
      'en': 'Find destinations...',
      'si': 'ගමනාන්ත සොයන්න...',
    },
    'qy9zt63h': {
      'en': 'Beach, mountains, long strolls...',
      'si': 'වෙරළ, කඳු, දිගු ඇවිදීම ...',
    },
    'xj7ps6ee': {
      'en': 'Explore top destinations around the world.',
      'si': 'ලොව පුරා ඉහළම ගමනාන්ත ගවේෂණය කරන්න.',
    },
    'g2en5mp0': {
      'en': 'Experience top destinations',
      'si': 'ඉහළම ගමනාන්තයන් අත්විඳින්න',
    },
    'onvn0bw1': {
      'en': '30 locations world wide',
      'si': 'ලොව පුරා ස්ථාන 30 ක්',
    },
    'mo28rnbq': {
      'en': 'Cinque Terre',
      'si': 'සින්ක් ටෙරේ',
    },
    'ff9frg4s': {
      'en': '4.7',
      'si': '4.7',
    },
    'wbg7mca3': {
      'en': '\$220 USD',
      'si': 'ඩොලර් 220 USD',
    },
    'f74hkw2r': {
      'en': 'Bellagio Italy',
      'si': 'බෙලාජියෝ ඉතාලිය',
    },
    'jbibi1mg': {
      'en': '4.7',
      'si': '4.7',
    },
    'b0o8pqn6': {
      'en': '\$220 USD',
      'si': 'ඩොලර් 220 USD',
    },
    'k1xwqzy6': {
      'en': 'Relaxing Places',
      'si': 'විවේක ස්ථාන',
    },
    '0lzd6zyb': {
      'en': '10 spots to catch some zzz\'s',
      'si': 'සමහර zzz අල්ලා ගැනීමට ස්ථාන 10 ක්',
    },
    'pygr0wmm': {
      'en': 'Firenze - Giardino Bardini',
      'si': 'Firenze - Giardino Bardini',
    },
    'm0hac4ue': {
      'en': '4.7',
      'si': '4.7',
    },
    'az4doe37': {
      'en': '\$220 USD',
      'si': 'ඩොලර් 220 USD',
    },
    '2h04t518': {
      'en': 'Cinque Terre',
      'si': 'සින්ක් ටෙරේ',
    },
    'j69wmerf': {
      'en': '4.7',
      'si': '4.7',
    },
    '4vz2rcch': {
      'en': '\$220 USD',
      'si': 'ඩොලර් 220 USD',
    },
  },
  // Home18Travel
  {
    'cosnv80t': {
      'en': 'Bali - Indonesia',
      'si': 'බාලි - ඉන්දුනීසියාව',
    },
    'gysefhd8': {
      'en': 'Discover the most popular places in Bali',
      'si': 'බාලි හි වඩාත් ජනප්‍රිය ස්ථාන සොයා ගන්න',
    },
    '5yy33oco': {
      'en': 'Who is looking?',
      'si': 'කවුද බලන්නේ?',
    },
    '8aqbnpmd': {
      'en': 'Explore Now',
      'si': 'දැන් ගවේෂණය කරන්න',
    },
    'hq9quc70': {
      'en': 'What else is popular',
      'si': 'වෙන මොනවද ජනප්‍රිය',
    },
    'fqf853nq': {
      'en': 'The Reefs',
      'si': 'ගල්පර',
    },
    'v57urqs1': {
      'en': '4.9 Stars',
      'si': 'තරු 4.9',
    },
    'x7u0024b': {
      'en': 'View Now',
      'si': 'දැන් බලන්න',
    },
    '4mxk30x7': {
      'en': 'Devils Cove',
      'si': 'ඩෙවිල්ස් කෝව්',
    },
    'ab42x703': {
      'en': '4.7 Stars',
      'si': 'තරු 4.7',
    },
    'n032mq1z': {
      'en': 'View Now',
      'si': 'දැන් බලන්න',
    },
    'q3wy1vtv': {
      'en': 'Juniper Beach',
      'si': 'ජුනිපර් වෙරළ',
    },
    '2lhnvq76': {
      'en': '4.5 Stars',
      'si': 'තරු 4.5',
    },
    '0u1bn5r3': {
      'en': 'View Now',
      'si': 'දැන් බලන්න',
    },
    'skrsbthe': {
      'en': 'Other Stays',
      'si': 'වෙනත් නවාතැන්',
    },
    'd2s6spq7': {
      'en': 'Main Header',
      'si': 'ප්රධාන ශීර්ෂකය',
    },
    'huubqgvm': {
      'en':
          'I’ll be working on a few different proposals, let me know when you’ve got time to go over them before the weekend.',
      'si':
          'මම විවිධ යෝජනා කිහිපයක් මත වැඩ කරන්නම්, සති අන්තයට පෙර ඒවා හරහා යාමට ඔබට කාලය ලැබුණු විට මට දන්වන්න.',
    },
    'zr0kwzvh': {
      'en': 'Main Header',
      'si': 'ප්රධාන ශීර්ෂකය',
    },
    'c5nqbehr': {
      'en':
          'I’ll be working on a few different proposals, let me know when you’ve got time to go over them before the weekend.',
      'si':
          'මම විවිධ යෝජනා කිහිපයක් මත වැඩ කරන්නම්, සති අන්තයට පෙර ඒවා හරහා යාමට ඔබට කාලය ලැබුණු විට මට දන්වන්න.',
    },
    '2mcmnotv': {
      'en': 'Current Location',
      'si': 'වත්මන් ස්ථානය',
    },
  },
  // PersonalRecommendation
  {
    'biyovdol': {
      'en': 'Personalized Recommendations',
      'si': 'පුද්ගලීකරණය කළ නිර්දේශ',
    },
    '3x0jocnz': {
      'en': 'Attractions',
      'si': 'ආකර්ෂණ',
    },
    'mgfw0bc1': {
      'en': 'Eiffel Tower',
      'si': 'අයිෆල් කුළුණ',
    },
    'nbbnevou': {
      'en': 'Paris, France',
      'si': 'පැරීසිය, ප්රංශය',
    },
    'xhqnyk5b': {
      'en':
          'One of the most famous landmarks in the world, the Eiffel Tower is a must-visit attraction in Paris. Enjoy stunning views of the city from the top.',
      'si':
          'ලෝකයේ වඩාත්ම ප්‍රසිද්ධ සන්ධිස්ථානයක් වන අයිෆල් කුළුණ පැරිසියේ නැරඹිය යුතුම ආකර්ෂණීය ස්ථානයකි. ඉහළ සිට නගරයේ ආකර්ෂණීය දර්ශන භුක්ති විඳින්න.',
    },
    'l7u9yyhc': {
      'en': '4.5',
      'si': '4.5',
    },
    '49ubxu8c': {
      'en': 'Statue of Liberty',
      'si': 'ලිබර්ටි ප්රතිමාව',
    },
    'wyykycr8': {
      'en': 'New York, USA',
      'si': 'නිව් යෝර්ක්, ඇමරිකා එක්සත් ජනපදය',
    },
    '4sawde4i': {
      'en':
          'A symbol of freedom and democracy, the Statue of Liberty is a must-visit attraction in New York. Take a ferry ride to Liberty Island and explore the museum inside the statue.',
      'si':
          'නිදහසේ සහ ප්‍රජාතන්ත්‍රවාදයේ සංකේතයක් වන ලිබර්ටි ප්‍රතිමාව නිව් යෝර්ක්හි නැරඹිය යුතුම ආකර්ෂණයකි. ලිබර්ටි අයිලන්ඩ් වෙත පාරු සවාරියක් ගෙන පිළිමය තුළ ඇති කෞතුකාගාරය ගවේෂණය කරන්න.',
    },
    '4zzmd6nw': {
      'en': '4.7',
      'si': '4.7',
    },
  },
  // Profile16CreateEdit
  {
    'l8xoz6su': {
      'en': 'Your Name',
      'si': 'ඔයාගේ නම',
    },
    '57x7nd31': {
      'en': 'Your Phone Number',
      'si': 'ඔබගේ දුරකථන අංකය',
    },
    '6gk23b5t': {
      'en': 'State',
      'si': 'රජයේ',
    },
    'bih97o1v': {
      'en': 'State',
      'si': 'රජයේ',
    },
    'rh48m6er': {
      'en': 'Central',
      'si': 'මධ්යම',
    },
    'g4uldjvm': {
      'en': 'Eastern',
      'si': 'නැගෙනහිර',
    },
    'ntzb0gh4': {
      'en': 'Northern',
      'si': 'උතුරු',
    },
    'ylkbovml': {
      'en': 'North Central',
      'si': 'උතුරු මැද',
    },
    'r8e106r8': {
      'en': 'North Western',
      'si': 'වයඹ',
    },
    'z9hdxunp': {
      'en': 'Sabaragamuwa',
      'si': 'සබරගමුව',
    },
    'vwor7e8i': {
      'en': 'Sothern',
      'si': 'දකුණු',
    },
    'albedkow': {
      'en': 'Uva',
      'si': 'ඌව',
    },
    'u6i3e5x7': {
      'en': 'Western',
      'si': 'බටහිර',
    },
    'ttdtzzfr': {
      'en': 'Select State',
      'si': 'රාජ්යය තෝරන්න',
    },
    'i1w4e903': {
      'en': 'Your City',
      'si': 'ඔබේ නගරය',
    },
    '5jii50q1': {
      'en': 'Blood Group',
      'si': 'ලේ වර්ගය',
    },
    '1m4plvmp': {
      'en': 'Blood Group',
      'si': 'ලේ වර්ගය',
    },
    '743xrgbm': {
      'en': 'A+',
      'si': 'A+',
    },
    'n6zxonmb': {
      'en': 'B+',
      'si': 'B+',
    },
    '0be55p16': {
      'en': 'AB+',
      'si': 'AB+',
    },
    'vbn4w5ky': {
      'en': 'O+',
      'si': 'O+',
    },
    'jzaetj5e': {
      'en': 'A-',
      'si': 'ඒ-',
    },
    '9q5h9x2s': {
      'en': 'B-',
      'si': 'බී-',
    },
    '3myux9tc': {
      'en': 'AB-',
      'si': 'AB-',
    },
    '35shtnnp': {
      'en': 'O-',
      'si': 'O-',
    },
    '8lirekte': {
      'en': 'Blood Group',
      'si': 'ලේ වර්ගය',
    },
    'w44vyc6f': {
      'en': 'Your bio',
      'si': 'ඔබේ ජීව දත්ත',
    },
    '9w26nb71': {
      'en': 'Save Changes',
      'si': 'වෙනස්කම් සුරකින්න',
    },
    'bmryzr7f': {
      'en': 'Create your Profile',
      'si': 'ඔබගේ පැතිකඩ සාදන්න',
    },
  },
  // Profile08
  {
    '4ra6uz5x': {
      'en': 'Settings',
      'si': 'සැකසුම්',
    },
    'bqkjphik': {
      'en': 'Phone Number',
      'si': 'දුරකථන අංකය',
    },
    '611ntyic': {
      'en': 'Language',
      'si': 'භාෂාව',
    },
    '84vujd6z': {
      'en': 'English (eng)',
      'si': 'ඉංග්රීසි (eng)',
    },
    'zhc6584h': {
      'en': 'Currency',
      'si': 'මුදල්',
    },
    'ld9momi8': {
      'en': 'US Dollar (\$)',
      'si': 'එක්සත් ජනපද ඩොලරය (\$)',
    },
    'ze67wj7y': {
      'en': 'Profile Settings',
      'si': 'පැතිකඩ සැකසුම්',
    },
    'ugn87y2i': {
      'en': 'Edit Profile',
      'si': 'පැතිකඩ සංස්කරණය කරන්න',
    },
    'kro48llw': {
      'en': 'Notification Settings',
      'si': 'දැනුම්දීම් සැකසීම්',
    },
    'mzexkccu': {
      'en': 'Log out of account',
      'si': 'ගිණුමෙන් ඉවත් වන්න',
    },
    '2ekpvijk': {
      'en': 'Log Out?',
      'si': 'ලොග් අවුට් ද?',
    },
    '7rmhxkjc': {
      'en': 'Done',
      'si': 'කළා',
    },
    'cp2lcn5o': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // Restaurants
  {
    '7wr0n6lw': {
      'en': 'Restaurants',
      'si': 'අවන්හල්',
    },
    'oco94bma': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // Sites
  {
    'juwpgmnb': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // ListHome
  {
    'xux9g48h': {
      'en': 'Search for your shoes...',
      'si': 'ඔබේ සපත්තු සොයන්න...',
    },
    'lvyssz2r': {
      'en': 'Categories',
      'si': 'වර්ග',
    },
    'd50051m5': {
      'en': 'Shop',
      'si': 'සාප්පු යන්න',
    },
  },
  // Events
  {
    '0z453uny': {
      'en': 'Events',
      'si': 'සිද්ධීන්',
    },
    'yzn3hcpq': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // EventsPage
  {
    '26k5z23l': {
      'en': 'Name',
      'si': 'නම',
    },
    'qf5qum8b': {
      'en': 'Address',
      'si': 'ලිපිනය',
    },
    '00alolrc': {
      'en': 'Open',
      'si': 'විවෘත',
    },
    '1akyh3m9': {
      'en': 'Accesion Number',
      'si': 'ප්රවේශ අංකය',
    },
    'qprzyn8m': {
      'en': 'View on Met Website',
      'si': 'Met වෙබ් අඩවියේ බලන්න',
    },
    '5j19lj5o': {
      'en': 'Add to Collection',
      'si': 'එකතුවට එකතු කරන්න',
    },
    'v019yzis': {
      'en': 'Home',
      'si': 'ගෙදර',
    },
  },
  // mylist
  {
    'ly1ne641': {
      'en': 'Categories',
      'si': 'වර්ග',
    },
    '9ncr0ian': {
      'en': 'Events',
      'si': 'සිද්ධීන්',
    },
    '7jaidizk': {
      'en': 'Restaurants',
      'si': 'අවන්හල්',
    },
    'y6ugxddk': {
      'en': 'Sites',
      'si': 'අඩවි',
    },
    'aqdazblp': {
      'en': 'Accomodations',
      'si': 'නවාතැන්',
    },
    'fnfl0zr1': {
      'en': 'Travel/ Drive',
      'si': 'ගමන් / ධාවනය',
    },
    'uiwqrswh': {
      'en': 'Emergency',
      'si': 'හදිසි',
    },
    '5gx7jawu': {
      'en': 'Sports',
      'si': 'ක්රීඩා',
    },
    '14gysv2y': {
      'en': 'Insurance',
      'si': 'රක්ෂණ',
    },
  },
  // Miscellaneous
  {
    '9mdfbi17': {
      'en': 'group',
      'si': 'සමූහය',
    },
    '466qharc': {
      'en': 'Blood Group',
      'si': 'ලේ වර්ගය',
    },
    '3yazwo4y': {
      'en': 'A+',
      'si': 'A+',
    },
    '0o5p8bi7': {
      'en': 'O+',
      'si': 'O+',
    },
    '05in8n67': {
      'en': 'B+',
      'si': 'B+',
    },
    '8ztlyd5m': {
      'en': 'AB+',
      'si': 'AB+',
    },
    '6qbaz3ez': {
      'en': 'A-',
      'si': 'ඒ-',
    },
    '8c77bn6n': {
      'en': 'O-',
      'si': 'O-',
    },
    '7rm637rw': {
      'en': 'B-',
      'si': 'බී-',
    },
    't4n80cho': {
      'en': 'AB-',
      'si': 'AB-',
    },
    'db8krumy': {
      'en': 'Blood Group',
      'si': 'ලේ වර්ගය',
    },
    'zn431cpe': {
      'en': '',
      'si': '',
    },
    'rp6bui5p': {
      'en': '',
      'si': '',
    },
    'ivgalorw': {
      'en': '',
      'si': '',
    },
    '1rytsiyw': {
      'en': '',
      'si': '',
    },
    'al6bgpum': {
      'en': '',
      'si': '',
    },
    'qrbriov3': {
      'en': '',
      'si': '',
    },
    'unp17fvb': {
      'en': '',
      'si': '',
    },
    'l58r5kiz': {
      'en': '',
      'si': '',
    },
    'vzry8z1r': {
      'en': '',
      'si': '',
    },
    'li0pvkrr': {
      'en': '',
      'si': '',
    },
    'znllqzhb': {
      'en': '',
      'si': '',
    },
    'fixnwk9s': {
      'en': '',
      'si': '',
    },
    'y5nnhs9r': {
      'en': '',
      'si': '',
    },
    'l8y5ted0': {
      'en': '',
      'si': '',
    },
    '27u2unsm': {
      'en': '',
      'si': '',
    },
    '8f7cd6sy': {
      'en': '',
      'si': '',
    },
    '3dtx6aq1': {
      'en': '',
      'si': '',
    },
    'vzugxkpa': {
      'en': '',
      'si': '',
    },
    'auw6qmvs': {
      'en': '',
      'si': '',
    },
    'xv4jgesi': {
      'en': '',
      'si': '',
    },
    'qhk5t0eu': {
      'en': '',
      'si': '',
    },
    'eowcmeqj': {
      'en': '',
      'si': '',
    },
    '78hftl8n': {
      'en': '',
      'si': '',
    },
    'sedxj614': {
      'en': '',
      'si': '',
    },
    'fevr01q3': {
      'en': '',
      'si': '',
    },
    '96ktbs1q': {
      'en': '',
      'si': '',
    },
  },
].reduce((a, b) => a..addAll(b));
