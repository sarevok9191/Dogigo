import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['tr', 'en'];

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
    String? trText = '',
    String? enText = '',
  }) =>
      [trText, enText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginScreen
  {
    '1k2icz9x': {
      'tr': 'Patido',
      'en': 'Patido',
    },
    'bt9ltxx5': {
      'tr': 'Şifremi Unuttum',
      'en': 'Forgot Password',
    },
    '9gjkvln3': {
      'tr': 'GİRİŞ YAP',
      'en': 'SIGN IN',
    },
    'epto80sf': {
      'tr': 'Henüz bir hesabınız yok mu?',
      'en': 'Don\'t you have any account here?',
    },
    'lc7udr6e': {
      'tr': 'ŞİMDİ KAYIT OL',
      'en': 'SIGN UP NOW',
    },
    'tyvtu294': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required',
    },
    'uq2mgm95': {
      'tr': 'Email formatında olmalıdır',
      'en': 'Must be in email format',
    },
    'ciky2bx6': {
      'tr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fyo6ov7b': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required',
    },
    'n123bw1d': {
      'tr': 'Bu alan 8 karakterden uzun olmalıdır.',
      'en': 'This field must be 8 characters long.',
    },
    'v85hgl5f': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    'gtzekjdt': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // ForgotPasswordScreen
  {
    'ex193fvg': {
      'tr': 'Patido',
      'en': 'Patido',
    },
    'b1muwgr2': {
      'tr': 'Yeni şifrenizi oluşturmak için bir kod alacaksınız.',
      'en':
          'You are going to take a code to recreate a new brand password of you.',
    },
    '8gn0bdsy': {
      'tr': 'KODU GÖNDER',
      'en': 'SEND CODE',
    },
    '7giu2nrv': {
      'tr': 'Henüz bir hesabınız yok mu?',
      'en': 'Don\'t you have any account here?',
    },
    'yemgklec': {
      'tr': 'ŞİMDİ KAYIT OL',
      'en': 'SIGN UP NOW',
    },
    'rfmfpuu6': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required',
    },
    'haidgfe0': {
      'tr': 'Email formatında olmalıdır',
      'en': 'Must be in email format',
    },
    'wm5e1c6o': {
      'tr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ksvhjorx': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required',
    },
    'a2h261jz': {
      'tr': 'Bu alan 8 karakterden uzun olmalıdır.',
      'en': 'This field must be 8 characters long.',
    },
    'gy2oqpvk': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    '2vn1ginh': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // ForgotPasswordEnterCodeScreen
  {
    'wwkndoi3': {
      'tr': 'Patido',
      'en': 'Patido',
    },
    '28nbgnrd': {
      'tr': 'E-mail adresinize gelen kodu girin.',
      'en':
          'Enter the code you recieved via \nyour e-mail to renew the password.',
    },
    '8v80ob7m': {
      'tr': 'ŞİFREYİ YENİLE',
      'en': 'RENEW PASSWORD',
    },
    '2ktv9smx': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required',
    },
    'v6q4y5mv': {
      'tr': 'Email formatında olmalıdır',
      'en': 'Must be in email format',
    },
    '2o2y55gu': {
      'tr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jn467540': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // ForgotPasswordRecreatePasswordScreen
  {
    '4tk2sk1o': {
      'tr': 'Patido',
      'en': 'Patido',
    },
    'o8wqchpj': {
      'tr': 'GİRİŞ YAP',
      'en': 'SIGN IN',
    },
    'flas5k1r': {
      'tr': 'Field is required',
      'en': '',
    },
    'upx7jwc0': {
      'tr': 'Şifre en az 8 haneli olmalıdır.',
      'en': 'Password must be at least 8 digits',
    },
    'co92rdz6': {
      'tr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'u207ip8w': {
      'tr': 'Field is required',
      'en': 'Field is required',
    },
    '0myww1od': {
      'tr': 'Şifre en az 8 haneli olmalıdır.',
      'en': 'Password must be at least 8 digits',
    },
    'ht5nu1g6': {
      'tr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'dkghgkeu': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // SplashScreen
  {
    'ckssmlpp': {
      'tr': 'Patido',
      'en': 'Patido',
    },
    'okonr6lq': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // RegisterScreen
  {
    'bb62k52v': {
      'tr': 'Kayıt Ol',
      'en': 'Sign Up',
    },
    'i7wkq3ob': {
      'tr': 'Hey, köpek dostu!  Lütfen hakkınızdaki genel bilgileri giriniz.',
      'en': 'Hey, Dog lover! Tell us a bit about yourself \n to get started.',
    },
    '65s7t44h': {
      'tr': 'E-posta',
      'en': 'Email',
    },
    'wsm9wjt2': {
      'tr': 'Kullanıcı Gizlilik Sözleşmesi',
      'en': 'I agree to the',
    },
    'wsm9wjt6': {
      'tr': 'Kullanıcı Gizlilik Sözleşmesi',
      'en': ' Terms Of Service and Privacy Policy',
    },
    'snp44xyp': {
      'tr': 'Kayıt olmak için kabul etmeniz gerekmektedir',
      'en': 'To register you must accept',
    },
    '5gsud5z1': {
      'tr': 'DEVAM ET',
      'en': 'CONTINUE',
    },
    'eplqyy62': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    'add7hcio': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    'd7hlvevb': {
      'tr': 'Bu alan zorunludur',
      'en': 'Field is required',
    },
    'th0u6nyw': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    'z3ow66co': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    '1f2orik3': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    'qs2zwihh': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    '07psa7di': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    '8nr04j2p': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    'tvf9in8f': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    '5to9vj73': {
      'tr': 'Güçlü bir parola gereklidir',
      'en': '',
    },
    'mjy2bv89': {
      'tr': 'Şifre en az 8 haneli olmalıdır',
      'en': 'Password must be at least 8 digits',
    },
    'hckn1m89': {
      'tr':
          'En az bir sayı, bir küçük harf, bir büyük harf ve bir özel karakter gereklidir',
      'en':
          'Password must be 8+ characters with uppercase, lowercase, number, and special character.',
    },
    '4gfxwy9e': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    '1keqcz0r': {
      'tr': 'Şifre en az 8 haneli olmalıdır',
      'en': 'Password must be at least 8 digits',
    },
    'ws6x7fxu': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    'm4grcpxn': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    'g70w482n': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    'c9dw02ie': {
      'tr': 'İnsanların sizi görebilmesi için profil fotoğrafınızı yükleyin.',
      'en': 'Upload your Profile picture so people can see you.',
    },
    '6b1a299c': {
      'tr': 'DEVAM ET',
      'en': 'CONTINUE',
    },
    '0hfahpzw': {
      'tr':
          'Şimdi köpeğinizin sırası. Lütfen onun hakkındaki genel bilgileri girin.',
      'en': 'It’s turn of your dog. Please enter general info about her/him.',
    },
    'tk3h5rh2': {
      'tr': 'DEVAM ET',
      'en': 'CONTINUE',
    },
    '8pybn55u': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    '4a74rhql': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    '6xns2zd9': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    'whqln67h': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    '8ndcj373': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    '6sque0lu': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    'ij1cyji8': {
      'tr':
          'Köpeğinizin profil fotoğrafını yükleyin. İnsanlar bu tatlılığın görsün.',
      'en':
          'Upload a profile picture of your dog. People will see this cuteness.',
    },
    't4tawj7h': {
      'tr': 'DEVAM ET',
      'en': 'CONTINUE',
    },
    '4iydsd9n': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // ProfileScreen
  {
    'vlczb105': {
      'tr': 'Profil',
      'en': 'Profile',
    },
    '465c9ttj': {
      'tr': '@',
      'en': '@',
    },
    'f7750jzd': {
      'tr': ' ARKADAŞ',
      'en': 'FRIENDS',
    },
    '52ahc33x': {
      'tr': 'Ayarlar',
      'en': 'Settings',
    },
    '2g5qrjh9': {
      'tr': 'Resim Galerisi',
      'en': 'Photo Gallery',
    },
    'kg473ctd': {
      'tr': 'Genel Bilgiler',
      'en': 'General Info',
    },
    'u1rwk84p': {
      'tr': 'KAYDET',
      'en': 'SAVE',
    },
    'b2crf1dx': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // ProfileGalleryScreen
  {
    'c3igd44z': {
      'tr': 'Fotoğraf Galerisi',
      'en': 'Photo Gallery',
    },
    '07j5970h': {
      'tr': 'Resimlerin sıralamalarını  ',
      'en': 'You can change the order among photos',
    },
    'hxmpc2tq': {
      'tr': 'kaydırarak değiştirebilirsiniz.',
      'en': ' by draging and dropping.',
    },
    'd4scalyq': {
      'tr': 'ÖNİZLE',
      'en': 'PREVIEW',
    },
    'nb8yfel9': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // MyDogsScreen
  {
    'esbebd4n': {
      'tr': 'Köpeklerim',
      'en': 'My Dogs',
    },
    '83ca21e3': {
      'tr': 'Yeni Köpek Ekle',
      'en': 'Add New Dog',
    },
    'd7cgg7hp': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // DogProfileScreen
  {
    '7mkppa6n': {
      'tr': 'Resim Galerisi',
      'en': 'Photo Gallery',
    },
    '2hrng5km': {
      'tr': 'Genel Bilgiler',
      'en': 'General Info',
    },
    'n3bzxcpz': {
      'tr': 'KAYDET',
      'en': 'SAVE',
    },
    '0sy7vfwd': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // DogGalleryScreen
  {
    'l9luxup7': {
      'tr': 'Resim Galerisi',
      'en': 'Photo Gallery',
    },
    'uhbcenqv': {
      'tr': 'Resimlerin sıralamalarını  ',
      'en': 'You can change the order among photos',
    },
    '8clf9afz': {
      'tr': 'kaydırarak değiştirebilirsiniz.',
      'en': ' by draging and dropping.',
    },
    '7qrt2st3': {
      'tr': 'ÖNİZLE',
      'en': 'PREVIEW',
    },
    '7yi15zbw': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // NotificationsScreen
  {
    '75e8p3al': {
      'tr': 'Bildirimler',
      'en': 'Notifications',
    },
    'o3f14179': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // IntroductionScreen
  {
    'ecrqendh': {
      'tr': 'EN',
      'en': 'EN',
    },
    'p75vdmb5': {
      'tr': 'TR',
      'en': 'TR',
    },
    'hkf2u7xg': {
      'tr': 'Patido',
      'en': 'Patido',
    },
    'akokz5se': {
      'tr': 'KAYIT OL',
      'en': 'SIGN UP',
    },
    'ahdmcplx': {
      'tr': 'Zaten bir hesabın var mı?',
      'en': 'Are you already a member here ?',
    },
    '7se73sei': {
      'tr': 'GİRİŞ YAP',
      'en': 'SIGN IN',
    },
    '9d3qhxwe': {
      'tr': 'Bu alan zorunludur',
      'en': 'Field is required',
    },
    'g7ar02os': {
      'tr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'x7cgg9bo': {
      'tr': 'Bu alan zorunludur',
      'en': 'Field is required',
    },
    'b2vpet8s': {
      'tr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'io039q12': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // AddNewDogScreen
  {
    'mma5dpzb': {
      'tr': 'Yeni Köpek Ekle',
      'en': 'Add New Dog',
    },
    'akhcz9sz': {
      'tr': 'Şimdi köpeğinizin sırası. Onun hakkında genel bilgiler ekleyin.',
      'en': 'It’s turn of your dog. Please enter general info about her/him.',
    },
    'cydp3ijw': {
      'tr': 'DEVAM ET',
      'en': 'CONTINUE',
    },
    'nu5hap2s': {
      'tr':
          'Köpeğinizin profil fotoğrafını yükleyin. İnsanlar bu güzelliği görsün.',
      'en':
          'Upload a profile picture of your dog. People will see this cuteness.',
    },
    'dckgc4cz': {
      'tr': 'DEVAM ET',
      'en': 'CONTINUE',
    },
    'vp027xq9': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // MyMessagesScreen
  {
    '5w4nv2ga': {
      'tr': 'Mesajlar',
      'en': 'Chats',
    },
    'ud71szty': {
      'tr': 'Mesaj arat',
      'en': 'Search for chat',
    },
    'qwztglxh': {
      'tr': 'KONUŞMA BAŞLAT',
      'en': 'NEW CHAT',
    },
  },
  // MyFriendsScreen
  {
    'zntmche1': {
      'tr': 'Arkadaşlarım',
      'en': 'Friends',
    },
  },
  // MessageScreen
  {
    'by9dvccu': {
      'tr': 'Bir hata oluştu lütfen tekrar deneyiniz.',
      'en': 'An error occurred, please try again.',
    },
    'x2y6vlky': {
      'tr': 'Bir hata oluştu lütfen tekrar deneyiniz.',
      'en': 'An error occurred, please try again.',
    },
    'm85jfda1': {
      'tr': 'Buraya artık mesaj gönderilemez',
      'en': 'You can no longer send messages here.',
    },
    'f4oytt3r': {
      'tr': 'Bir yanlışlık olduğunu düşünüyorsanız bizimle iletişime geçiniz.',
      'en': 'If you think there is a mistake, please contact us.',
    },
    'xrgl0m5a': {
      'tr': 'Bir hata oluştu lütfen tekrar deneyiniz.',
      'en': 'An error occurred, please try again.',
    },
  },
  // ProfilePreviewScreen
  {
    'md06waug': {
      'tr': 'ÇEVRİMİÇİ',
      'en': 'ONLINE',
    },
    'jllqt064': {
      'tr': '1,2 km',
      'en': '1,2 km',
    },
    'v0cz1e2z': {
      'tr': 'PROFİLE GERİ DÖN',
      'en': 'BACK TO PROFILE',
    },
    '5497vzyw': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // DogProfilePreviewScreen
  {
    '3uobw8j2': {
      'tr': 'ÇEVRİMİÇİ',
      'en': 'ONLINE',
    },
    'axd4cv2w': {
      'tr': '1,2 km',
      'en': '1,2 km',
    },
    'rt3ebpr6': {
      'tr': 'PROFİLE GERİ DÖN',
      'en': 'BACK TO PROFILE',
    },
    'jfuctaci': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // SettingsScreen
  {
    'od99hrtb': {
      'tr': 'Ayarlar',
      'en': 'Settings',
    },
    'vj680738': {
      'tr': 'Profilini kimler görebilir ',
      'en': 'Who can see your profile ',
    },
    'n7cgs1lx': {
      'tr': 'haritada',
      'en': 'on map',
    },
    'i4g5obgi': {
      'tr': 'Hiç Kimse',
      'en': 'Nobody',
    },
    'ifhq80b6': {
      'tr': 'Sadece Şu Arkadaşlarım',
      'en': 'Only These Friends',
    },
    'g0bapejx': {
      'tr': 'Herkes',
      'en': 'Everybody',
    },
    'aqwifj9r': {
      'tr': 'Profil Görünürlüğü ',
      'en': 'Profile Appearance ',
    },
    'barbl0ma': {
      'tr': 'arkadaşlarım için',
      'en': 'to friends',
    },
    '97jsvwut': {
      'tr': 'Yaş',
      'en': 'Age',
    },
    '41bjm9ja': {
      'tr': 'Konum',
      'en': 'Location',
    },
    'v2g5h8pc': {
      'tr': 'Mesafe',
      'en': 'Distance',
    },
    's3u9mlnt': {
      'tr': 'Cinsiyet',
      'en': 'Sex',
    },
    'o68ybn1f': {
      'tr': 'Profil Görünürlüğü ',
      'en': 'Profile Appearance ',
    },
    'a8kq7koe': {
      'tr': 'arkadaşım olmayan insanlar için',
      'en': 'to people aren\'t friends',
    },
    'xv5r0hx2': {
      'tr': 'Yaş',
      'en': 'Age',
    },
    'tsfamkfn': {
      'tr': 'Konum',
      'en': 'Location',
    },
    'cygrlc94': {
      'tr': 'Mesafe',
      'en': 'Distance',
    },
    '8n0cl20r': {
      'tr': 'Cinsiyet',
      'en': 'Sex',
    },
    'rx6yqou1': {
      'tr': 'Uygulama Dili',
      'en': 'App Language',
    },
    '0u9hkidi': {
      'tr': 'Dil Seç',
      'en': 'Select Language',
    },
    'x9re5snn': {
      'tr': 'Dil Seç',
      'en': 'Select Language',
    },
    'thpqvrr8': {
      'tr': 'Hesabımı sil',
      'en': 'Delete my account',
    },
    'jvto7udo': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // SwipeScreen
  {
    '6gukib6e': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // NotificationLikeScreen
  {
    'i1rdupmd': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // qwe
  {
    'ify80am0': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // ChangePasswordScreen
  {
    '7xu6whwf': {
      'tr': 'Bu alan zorunludur',
      'en': '',
    },
    'fcshqwew': {
      'tr': 'Şifre en az 8 karakterden oluşmalıdır',
      'en': '',
    },
    'cgpq10tz': {
      'tr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '82hyyylq': {
      'tr': 'Bu alan zorunludur',
      'en': '',
    },
    'gqu00413': {
      'tr': 'Şifre en az 8 karakterden oluşmalıdır',
      'en': '',
    },
    '52nvenqo': {
      'tr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8e247gfz': {
      'tr': 'Bu alan zorunludur',
      'en': '',
    },
    'awnl53p3': {
      'tr': 'Şifre en az 8 karakterden oluşmalıdır',
      'en': '',
    },
    'ysngl6xv': {
      'tr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'c6jfxy60': {
      'tr': 'Şifremi Unuttum',
      'en': 'Forgot Password',
    },
    'fqwij0hn': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // ForgotPasswordSettingsScreen
  {
    'xbkhw0cx': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // NewPasswordSettingsScreen
  {
    'o21247h0': {
      'tr': 'Bu alan zorunludur',
      'en': '',
    },
    'fakej337': {
      'tr': 'Şifre en az 8 karakterden oluşmalıdır',
      'en': '',
    },
    '2oq1dmqn': {
      'tr': 'E-Mail formatı hatalı',
      'en': '',
    },
    'svyj4u58': {
      'tr': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8cinf32k': {
      'tr': 'Bu alan zorunludur',
      'en': 'Field is required',
    },
    'tcbfa2m9': {
      'tr': 'Şifre en az 8 karakterden oluşmalıdır',
      'en': '',
    },
    'q8molpeu': {
      'tr': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '55eyqfyd': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // CheckCodeScreen
  {
    '0mrlwoq2': {
      'tr': 'Bu alan zorunludur',
      'en': '',
    },
    'aju647hu': {
      'tr': 'Kod en az 6 karakterden oluşmalıdır',
      'en': '',
    },
    'j8r12y9g': {
      'tr': 'Kod en fazla 6 karakterden oluşmalıdır',
      'en': '',
    },
    'fni5rhtt': {
      'tr': 'E-Mail formatı hatalı',
      'en': '',
    },
    'vn0t0m0g': {
      'tr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wygwolhi': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // FriendProfileScreen
  {
    'pzaksuqt': {
      'tr': '@',
      'en': '@',
    },
    'rlc2bx8r': {
      'tr': ' ARKADAŞ',
      'en': 'FRIENDS',
    },
    'yqtzlezc': {
      'tr': 'Dogs of ',
      'en': '',
    },
    'nxbc7sz0': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // PreferedDogScreen
  {
    '0v9ikbzy': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // NotificationFriendScreen
  {
    'pbjpdcg9': {
      'tr': 'Zaten Arkadaşsınız',
      'en': 'You are already friends',
    },
    '3562u30t': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // SearchScreen
  {
    'de6ajgpw': {
      'tr': 'Kişi Ara',
      'en': 'Search People',
    },
    '7i1o3dta': {
      'tr': 'Bekleniyor',
      'en': 'Waiting',
    },
    '9m3qvk4v': {
      'tr': 'Arkadaş Ekle',
      'en': 'Add Friend',
    },
    'pqazsebe': {
      'tr': 'Aramaya Devam Et',
      'en': 'Continue Searching',
    },
    '8vl8svbn': {
      'tr': 'Ve Daha Fazla Kişi Keşfet',
      'en': 'And Discover More People',
    },
    'ah87aha5': {
      'tr': 'Aramana uygun sonuç  bulamadık',
      'en': 'We couldn\'t find any results matching your search.',
    },
  },
  // ShowUserImage
  {
    'xik2wccs': {
      'tr': 'Geri',
      'en': 'Back',
    },
    'me4qt70l': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // ExampleSheet
  {
    'a69eh9n3': {
      'tr': 'Edit Post',
      'en': '',
    },
    'qpglaxc3': {
      'tr': 'Delete Story',
      'en': '',
    },
    'z0qplezz': {
      'tr': 'Cancel',
      'en': '',
    },
  },
  // conversation
  {
    'sb2q222w': {
      'tr': 'Sohbet edin',
      'en': 'Chat For More',
    },
  },
  // deleteDogModal
  {
    '26fi11mw': {
      'tr': 'Siliyorsun ',
      'en': 'You are deleting ',
    },
    'v5ywhnhf': {
      'tr': 'İPTAL',
      'en': 'CANCEL',
    },
    'at9wlnkn': {
      'tr': 'Sil',
      'en': 'Delete',
    },
  },
  // addDogModal
  {
    '2y2q9p1e': {
      'tr': ' tanışmaya hazır',
      'en': ' is ready to meet',
    },
    '95xjezcm': {
      'tr': 'ŞİMDİ BAŞLA',
      'en': 'START NOW',
    },
  },
  // registerDoneSheet
  {
    'k8s0sebx': {
      'tr': 'Neredeyse Bitti',
      'en': 'Almost Done',
    },
    'el77pzn7': {
      'tr': '@',
      'en': '@',
    },
    '2muzgv7i': {
      'tr': ', ',
      'en': '',
    },
    '3rjv3bn2': {
      'tr': ' Köpekleri',
      'en': 'Dogs \n',
    },
    '8j5z1fj9': {
      'tr': 'ŞİMDİ BAŞLA',
      'en': 'LET\'S START',
    },
  },
  // optionsSheet
  {
    'r7krxs50': {
      'tr': '',
      'en': '',
    },
    'xkyzx1wb': {
      'tr': 'Arama Yapın',
      'en': 'Search',
    },
  },
  // actionToFriendModal
  {
    'mp0l1epr': {
      'tr': 'Şikayet ediyorsun ',
      'en': 'You are reporting ',
    },
    'jbxpz9i9': {
      'tr': 'ŞİKAYET ET',
      'en': 'REPORT',
    },
    'meqx76o0': {
      'tr': 'ENGELLE',
      'en': 'BLOCK',
    },
  },
  // blockFriendModal
  {
    '9bb9s7qk': {
      'tr': 'Sen ',
      'en': 'You ',
    },
    'kr0b6h1w': {
      'tr': 'PATIDO\'YA DÖN',
      'en': 'BACK TO PATIDO',
    },
  },
  // deleteAccountModal
  {
    '9yrpm5hq': {
      'tr': 'Hesabını ',
      'en': 'You are deleting ',
    },
    'ce3wjlsk': {
      'tr': 'siliyorsun',
      'en': 'your account',
    },
    'dgo6odrk': {
      'tr': 'İPTAL',
      'en': 'CANCEL',
    },
    '0s6cn48b': {
      'tr': 'Sil',
      'en': 'Delete',
    },
  },
  // deleteAccountSureModal
  {
    '2780adku': {
      'tr': 'Ayrılmak istediğine emin misin?',
      'en': 'Are you sure about the leave?',
    },
    'nnwt2koi': {
      'tr': 'HAYIR!',
      'en': 'NO!',
    },
    'v8cwlry5': {
      'tr': 'Evet, hesabım silinsin.',
      'en': 'Yes, delete my account.',
    },
  },
  // settingsFriendsSheet
  {
    'ativqmm7': {
      'tr': 'Arkadaşlarımı ara',
      'en': 'Search friends',
    },
    'qzkcg7rk': {
      'tr': 'KAYDET & DEVAM ET',
      'en': 'SAVE & CONTINUE',
    },
  },
  // Sidebar
  {
    't55789qx': {
      'tr': 'Yeni Arkadaşlar Bul',
      'en': 'Find New Friends',
    },
    '2m16c76b': {
      'tr': 'Profil',
      'en': 'Profile',
    },
    'sz4npsef': {
      'tr': 'Köpeklerim',
      'en': 'My Dogs',
    },
    'uwjj1dxd': {
      'tr': 'Bildirimler',
      'en': 'Notifications',
    },
    'quhlfbu8': {
      'tr': 'Harita',
      'en': 'Map',
    },
    'dvg6uty2': {
      'tr': 'Mesajlar',
      'en': 'Messages',
    },
    'r95g5qfs': {
      'tr': 'Ayarlar',
      'en': 'Settings',
    },
    'lbeiijw5': {
      'tr': 'Arkadaşlarım',
      'en': 'Friends',
    },
    '7wwwh94a': {
      'tr': 'ÇIKIŞ YAP',
      'en': 'SIGN OUT',
    },
  },
  // SwipePageItem
  {
    'zwvtx5gt': {
      'tr': 'ÇEVRİMİÇİ',
      'en': 'ONLINE',
    },
  },
  // notificationItem
  {
    'y30fsz5j': {
      'tr': ' köpeğinizi beğendi  (',
      'en': ' liked your dog (',
    },
    '9jm4854u': {
      'tr': ')',
      'en': ')',
    },
    'py11falg': {
      'tr': ' sizi dürttü',
      'en': ' poked you',
    },
    'bfcmzn16': {
      'tr': ' arkadaşlık isteği gönderdi',
      'en': ' wants to be friends with you',
    },
    'ely4gcre': {
      'tr': 'Tanımlanamayan bildirim',
      'en': 'Undefined Notification',
    },
  },
  // passwordChangedModal
  {
    '6ngd5n3b': {
      'tr': 'PATIDO\'YA DÖN',
      'en': 'BACK TO PATIDO',
    },
  },
  // settingsReportsSheet
  {
    '17yl60ur': {
      'tr': 'Arkadaşlarımı ara',
      'en': 'Search friends',
    },
    '699acuda': {
      'tr': 'KAYDET & DEVAM ET',
      'en': 'SAVE & CONTINUE',
    },
  },
  // mapDogInfoSheet
  {
    '3vrob6qy': {
      'tr': ', ',
      'en': '',
    },
  },
  // mapUserInfoSheet
  {
    '0am0doj1': {
      'tr': '@',
      'en': '@',
    },
    'vlnfvbw1': {
      'tr': ',  ',
      'en': '',
    },
    'inw10lfu': {
      'tr': 'Moda, Kadıköy',
      'en': 'Moda, Kadıköy',
    },
    'ms10q3u7': {
      'tr': 'Köpekleri',
      'en': 'Dogs',
    },
  },
  // RegisterCreateDogSheet
  {
    '53xga6cj': {
      'tr': 'Köpek Ekle',
      'en': 'Add your dog',
    },
    '5e59nlw0': {
      'tr':
          'Şimdi köpeğinizin sırası. Lütfen onun hakkındaki genel bilgileri girin.',
      'en': 'It’s turn of your dog. Please enter general info about her/him.',
    },
    'kbgt4x9k': {
      'tr': 'DEVAM ET',
      'en': 'CONTINUE',
    },
    'ncdqc5du': {
      'tr': 'Geçersiz Tarih',
      'en': 'Invalid Date',
    },
    '7b2ewpsm': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    '6wdqnjtj': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    '9o4hpxck': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    'cguhry6m': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
    '2ofg03a3': {
      'tr': 'Bu alan zorunludur',
      'en': 'This field is required.',
    },
    'glevwcem': {
      'tr': 'Lütfen seçeneklerden bir tanesini seçin',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // WarningSheet
  {
    'qfuomynh': {
      'tr': 'Bir Hata Oluştu',
      'en': 'An Error Occurred',
    },
  },
  // ReportSheet
  {
    '7cdtkglj': {
      'tr': 'İçerik Raporlayın',
      'en': 'Report Content',
    },
    'hxtf6y72': {
      'tr':
          'Rahatsız edici veya politikaları ihlal ettiğini düşündüğünnüz içeriği raporlayın',
      'en': 'Report content that you find offensive or violating policies',
    },
    'g0ghle92': {
      'tr': 'Açıklama',
      'en': 'Description',
    },
    'o47410np': {
      'tr': 'Cinsel İçerik',
      'en': 'Sexual   Content',
    },
    'jz9a9rsp': {
      'tr': 'Uygunsuz veya yetişkinlere yönelik içerik barındıran paylaşımlar.',
      'en': 'Posts that contain inappropriate or adult content.',
    },
    'n5qzhd8l': {
      'tr': 'Şiddet İçeriği',
      'en': 'Violent Content',
    },
    'ihycz646': {
      'tr': 'Şiddet, tehdit veya saldırgan davranışlar içeren içerikler.',
      'en': 'Content that contains violence, threats or offensive behavior.',
    },
    '5ijrmarn': {
      'tr': 'Spam',
      'en': 'Spam',
    },
    'k8t8c38f': {
      'tr': 'Gereksiz, tekrarlayan veya yanıltıcı reklam içerikli paylaşımlar.',
      'en':
          'Posts that contain unnecessary, repetitive or misleading advertising content.',
    },
    'i56woby5': {
      'tr': 'Telif Hakkı İhlali',
      'en': 'Copyright Violation',
    },
    'ndqps3tw': {
      'tr': 'İzinsiz kullanılan telif hakkına sahip materyallerin paylaşımı.',
      'en': 'Sharing of copyrighted materials used without permission.',
    },
    'up6qhrcg': {
      'tr': 'Gönder',
      'en': 'Send',
    },
    '3ke235z4': {
      'tr': 'Bir hata oluştu lütfen daha sonra tekrar deneyin',
      'en': 'An error occurred please try again later',
    },
    '0q07fwo9': {
      'tr': 'Raporunuz Başarıyla Gönderildi',
      'en': 'Your Report Has Been Submitted Successfully',
    },
    'ye5xiss1': {
      'tr':
          'Raporun için teşekkürler! Güvenli ve keyifli bir deneyim sağlamak için gösterdiğin hassasiyet bizim için çok değerli. Bildirimini aldık ve en kısa sürede inceleyerek gerekli adımları atacağız. Topluluğumuzu daha iyi bir yer haline getirmeye katkıda bulunduğun için minnettarız. Senin gibi duyarlı kullanıcılarımız sayesinde Patido daha güvenli bir platform oluyor. Her zaman buradayız! Teşekkürler! 🐾',
      'en':
          'Thank you for your report! We appreciate your attention to detail to ensure a safe and enjoyable experience. We have received your report and will review it as soon as possible and take the necessary steps. We are grateful for your contribution to making our community a better place. Patido is a safer platform thanks to caring users like you. We are always here! Thank you! 🐾',
    },
    '3y3p9vzv': {
      'tr': 'Cinsel İçerik: ',
      'en': 'Sexual Content:',
    },
    'k7ywhgaj': {
      'tr':
          'Hepimiz için güvenli bir ortam yaratmak çok önemli. Bu tür içerikler, kullanıcıları rahatsız edebilir ve topluluğumuzdaki samimiyeti zedeleyebilir. Birlikte keyifli bir alanı korumak için hepimizin katkısı çok değerli.\n',
      'en':
          'Creating a safe environment for all of us is essential. This type of content can make users uncomfortable and damage the intimacy in our community. We all contribute to maintaining a fun space together.',
    },
    '5am4poxx': {
      'tr': 'Şiddet İçeriği: ',
      'en': 'Violent Content:',
    },
    '1gm5rs3n': {
      'tr':
          'Kimse platformda endişe veya huzursuzluk hissetmek istemez. Şiddet içeren içerikler, hem moral bozabilir hem de insanların burada kendini güvende hissetmesini engelleyebilir. Topluluğumuzun huzurlu ve sıcak kalması için hassasiyetin çok kıymetli!\n',
      'en':
          'No one wants to feel anxious or uneasy on the platform. Violent content can be both demoralizing and make people feel unsafe here. Your sensitivity is very important to keep our community peaceful and warm!',
    },
    '3tvkdzig': {
      'tr': 'Spam İçerik: ',
      'en': 'Spam Content: ',
    },
    'cr0ul42m': {
      'tr':
          'Burada keyifli vakit geçirmek ve kaliteli içeriklerle karşılaşmak hepimizin hakkı. Sürekli tekrarlayan veya alakasız paylaşımlar, bu deneyimi zorlaştırır ve kullanıcıların canını sıkabilir. Sayende platformumuz daha düzenli ve keyifli kalacak!\n',
      'en':
          'We all have the right to have a pleasant time here and encounter quality content. Constantly repetitive or irrelevant posts make this experience difficult and can annoy users. Thanks to you, our platform will remain more organized and enjoyable!',
    },
    'xk9rirbh': {
      'tr': 'Telif Hakkı İhlali: ',
      'en': 'Copyright Violation:',
    },
    'uol3w18y': {
      'tr':
          'İnsanların emeğine saygı göstermek hepimiz için önemli. İzinsiz kullanılan içerikler hem içerik üreticilerini hem de platformumuzu zor duruma sokabilir. Duyarlılığın sayesinde herkesin emeğine saygı duyulan bir ortam yaratıyoruz.\n',
      'en':
          'Respecting people\'s labor is important to all of us. Content used without permission can put both content creators and our platform in a difficult position. Through sensitivity, we create an environment where everyone\'s labor is respected.',
    },
  },
  // ReportMessageSheet
  {
    'g6i0evft': {
      'tr': 'İçerik Raporlayın',
      'en': 'Report Content',
    },
    '7lcs3tz7': {
      'tr':
          'Rahatsız edici veya politikaları ihlal ettiğini düşündüğünnüz içeriği raporlayın',
      'en': 'Report content that you find offensive or violating policies',
    },
    'q8hbid3d': {
      'tr': 'Şu Referansa Sahip Mesajı Raporluyorsunuz:',
      'en': 'You are reporting a message with the following reference:',
    },
    'msj5bslo': {
      'tr': 'Açıklama',
      'en': 'Description',
    },
    'ibyxj9wt': {
      'tr': 'Cinsel İçerik',
      'en': 'Sexual   Content',
    },
    'zjmobe3p': {
      'tr': 'Uygunsuz veya yetişkinlere yönelik içerik barındıran paylaşımlar.',
      'en': 'Posts that contain inappropriate or adult content.',
    },
    'un0wdjb5': {
      'tr': 'Şiddet İçeriği',
      'en': 'Violent Content',
    },
    'nsancsks': {
      'tr': 'Şiddet, tehdit veya saldırgan davranışlar içeren içerikler.',
      'en': 'Content that contains violence, threats or offensive behavior.',
    },
    '36uzs7eb': {
      'tr': 'Spam',
      'en': 'Spam',
    },
    'figo94pk': {
      'tr': 'Gereksiz, tekrarlayan veya yanıltıcı reklam içerikli paylaşımlar.',
      'en':
          'Posts that contain unnecessary, repetitive or misleading advertising content.',
    },
    'kyn146r7': {
      'tr': 'Telif Hakkı İhlali',
      'en': 'Copyright Violation',
    },
    'qwialy8p': {
      'tr': 'İzinsiz kullanılan telif hakkına sahip materyallerin paylaşımı.',
      'en': 'Sharing of copyrighted materials used without permission.',
    },
    '0e75ft9p': {
      'tr': 'Gönder',
      'en': 'Send',
    },
    'oadrgrko': {
      'tr': 'Bir hata oluştu lütfen daha sonra tekrar deneyin',
      'en': 'An error occurred please try again later',
    },
    'xfv0mmb1': {
      'tr': 'Raporunuz Başarıyla Gönderildi',
      'en': 'Your Report Has Been Submitted Successfully',
    },
    'pbhv2nz4': {
      'tr':
          'Raporun için teşekkürler! Güvenli ve keyifli bir deneyim sağlamak için gösterdiğin hassasiyet bizim için çok değerli. Bildirimini aldık ve en kısa sürede inceleyerek gerekli adımları atacağız. Topluluğumuzu daha iyi bir yer haline getirmeye katkıda bulunduğun için minnettarız. Senin gibi duyarlı kullanıcılarımız sayesinde Patido daha güvenli bir platform oluyor. Her zaman buradayız! Teşekkürler! 🐾',
      'en':
          'Thank you for your report! We appreciate your attention to detail to ensure a safe and enjoyable experience. We have received your report and will review it as soon as possible and take the necessary steps. We are grateful for your contribution to making our community a better place. Patido is a safer platform thanks to caring users like you. We are always here! Thank you! 🐾',
    },
    'df04s2th': {
      'tr': 'Cinsel İçerik: ',
      'en': 'Sexual Content:',
    },
    'y9k3jgip': {
      'tr':
          'Hepimiz için güvenli bir ortam yaratmak çok önemli. Bu tür içerikler, kullanıcıları rahatsız edebilir ve topluluğumuzdaki samimiyeti zedeleyebilir. Birlikte keyifli bir alanı korumak için hepimizin katkısı çok değerli.\n',
      'en':
          'Creating a safe environment for all of us is essential. This type of content can make users uncomfortable and damage the intimacy in our community. We all contribute to maintaining a fun space together.',
    },
    'a4kg6brr': {
      'tr': 'Şiddet İçeriği: ',
      'en': 'Violent Content:',
    },
    '1isupqik': {
      'tr':
          'Kimse platformda endişe veya huzursuzluk hissetmek istemez. Şiddet içeren içerikler, hem moral bozabilir hem de insanların burada kendini güvende hissetmesini engelleyebilir. Topluluğumuzun huzurlu ve sıcak kalması için hassasiyetin çok kıymetli!\n',
      'en':
          'No one wants to feel anxious or uneasy on the platform. Violent content can be both demoralizing and make people feel unsafe here. Your sensitivity is very important to keep our community peaceful and warm!',
    },
    '31g4by4m': {
      'tr': 'Spam İçerik: ',
      'en': 'Spam Content: ',
    },
    'wnss311p': {
      'tr':
          'Burada keyifli vakit geçirmek ve kaliteli içeriklerle karşılaşmak hepimizin hakkı. Sürekli tekrarlayan veya alakasız paylaşımlar, bu deneyimi zorlaştırır ve kullanıcıların canını sıkabilir. Sayende platformumuz daha düzenli ve keyifli kalacak!\n',
      'en':
          'We all have the right to have a pleasant time here and encounter quality content. Constantly repetitive or irrelevant posts make this experience difficult and can annoy users. Thanks to you, our platform will remain more organized and enjoyable!',
    },
    'xqtlr8ej': {
      'tr': 'Telif Hakkı İhlali: ',
      'en': 'Copyright Violation:',
    },
    '2a37b4ks': {
      'tr':
          'İnsanların emeğine saygı göstermek hepimiz için önemli. İzinsiz kullanılan içerikler hem içerik üreticilerini hem de platformumuzu zor duruma sokabilir. Duyarlılığın sayesinde herkesin emeğine saygı duyulan bir ortam yaratıyoruz.\n',
      'en':
          'Respecting people\'s labor is important to all of us. Content used without permission can put both content creators and our platform in a difficult position. Through sensitivity, we create an environment where everyone\'s labor is respected.',
    },
  },
  // deleteMessageModal
  {
    'w7x1h33h': {
      'tr': 'Sohbeti ',
      'en': 'You are deleting ',
    },
    '853rurv1': {
      'tr': 'siliyorsun',
      'en': 'your chat',
    },
    '1mp7nu3k': {
      'tr': 'İPTAL',
      'en': 'CANCEL',
    },
    'zz58rguv': {
      'tr': 'Sil',
      'en': 'Delete',
    },
  },
  // MessageUserPreviewPhoto
  {
    'l908815h': {
      'tr': 'Geri',
      'en': 'Back',
    },
  },
  // Miscellaneous
  {
    '82siipnx': {
      'tr':
          'Patido\'nun, fotoğraf çekmek ve paylaşmak için kameranızı kullanmasına izin verin.',
      'en': 'Allow Patido to access your camera to take and share photos.',
    },
    '5pp520xs': {
      'tr':
          'Patido\'nun, fotoğraflarınıza erişmesine izin vererek, fotoğraflarınızı paylaşabilir ve galerinizden içerik seçebilirsiniz.',
      'en':
          'Allow Patido to access your photos so you can share them and select content from your gallery.',
    },
    'gbpllmod': {
      'tr':
          'Patido\'nun, çevrenizdeki kişileri bulabilmek ve kişiselleştirilmiş bir deneyim sunabilmek için konum bilginize erişmesine izin verin',
      'en':
          'Allow Patido to access your location to find nearby users and provide a personalized experience.',
    },
    '4sgqzkat': {
      'tr':
          'Patido\'nun, bağlantılarınız, mesajlarınız ve diğer önemli güncellemeler hakkında sizi bilgilendirmesi için bildirim göndermesine izin verin',
      'en':
          'Allow Patido to send notifications to keep you updated on connections, messages, and other important updates.',
    },
    'mkk34uby': {
      'tr':
          'Patido\'nun, deneyiminizi iyileştirmek ve size uygun içerikler göstermek için kullanım verilerinizi toplamasına izin verin',
      'en':
          'Allow Patido to collect usage data to enhance your experience and show you relevant content.',
    },
    'z97a0iim': {
      'tr':
          'Patido\'nun, çevrenizdeki kişileri bulabilmek ve kişiselleştirilmiş bir deneyim sunabilmek için konum bilginize erişmesine izin verin.',
      'en':
          'Allow Patido to access your location to find nearby users and provide a personalized experience.',
    },
    'xeqe2ols': {
      'tr': 'Oturum Hatası Lütfen Tekrar Deneyin',
      'en': 'Auth Error Please Try Again ',
    },
    'u2p704bc': {
      'tr': '',
      'en': '',
    },
    'y2451xuh': {
      'tr': '',
      'en': '',
    },
    'p6ac64x1': {
      'tr': '',
      'en': '',
    },
    'i7knh0ry': {
      'tr': '',
      'en': '',
    },
    '9dd0jm1k': {
      'tr': '',
      'en': '',
    },
    '6ulzh72c': {
      'tr': '',
      'en': '',
    },
    'ff9s2slx': {
      'tr': '',
      'en': '',
    },
    'j08o65q1': {
      'tr': '',
      'en': '',
    },
    'brbjwdue': {
      'tr': '',
      'en': '',
    },
    '7ciuji94': {
      'tr': 'Oturum Süresi Doldu Veya Kayıt Bulunamadı',
      'en': 'Session Expired Or Record Not Found',
    },
    'cjd97n2v': {
      'tr': 'Geçersiz  Dosya Formatı',
      'en': 'Invalid File Format',
    },
    'rjspwofi': {
      'tr': 'Dosya yükleniyor...',
      'en': 'Uploading file...',
    },
    '5vovsdod': {
      'tr': 'Başarıyla Yüklendi!',
      'en': 'Upload Success!',
    },
    'sdh0os4t': {
      'tr': 'Veri yüklenemedi',
      'en': 'Failed to upload data',
    },
    'v81aed0q': {
      'tr': '',
      'en': '',
    },
    '9r2lx6lk': {
      'tr': 'Kaynak Seçin',
      'en': 'Choose Source',
    },
    'bg8z8f5e': {
      'tr': 'Galeri',
      'en': 'Gallery',
    },
    '60apri5k': {
      'tr': 'Galeri (Fotoğraf)',
      'en': 'Gallery (Photo)',
    },
    'z0mwg01w': {
      'tr': 'Galeri (Video)',
      'en': 'Gallery (Video)',
    },
    'm1x9u4fw': {
      'tr': 'Kamera',
      'en': 'Camera',
    },
    '72ahutuc': {
      'tr': '',
      'en': '',
    },
    'wdfrxv6i': {
      'tr': '',
      'en': '',
    },
    'laeiegnq': {
      'tr': '',
      'en': '',
    },
    'xpkc3u8r': {
      'tr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
