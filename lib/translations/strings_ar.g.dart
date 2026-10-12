///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$ar common = _Translations$common$ar._(_root);
	@override late final _Translations$auth$ar auth = _Translations$auth$ar._(_root);
	@override late final _Translations$onboarding$ar onboarding = _Translations$onboarding$ar._(_root);
}

// Path: common
class _Translations$common$ar implements Translations$common$en {
	_Translations$common$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Doctor Hunt';
	@override String get continueText => 'متابعة';
	@override String get next => 'التالي';
	@override String get skip => 'تخطي';
}

// Path: auth
class _Translations$auth$ar implements Translations$auth$en {
	_Translations$auth$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get welcomeMessage => 'أهلاً بك في Doctor Hunt!';
	@override String get name => 'الاسم';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور الجديدة';
	@override String get confirmPassword => 'أعد إدخال كلمة المرور';
	@override String get privacyPolicy => 'أوافق على شروط الخدمة وسياسة الخصوصية';
	@override String get forgotPassword => 'نسيت كلمة المرور';
	@override String get signUpTitle => 'انضم إلينا لتبدأ البحث';
	@override String get signUpSubtitle => 'يمكنك البحث عن الدورات والتقديم عليها والعثور على منح للدراسة بالخارج';
	@override String get signInTitle => 'مرحباً بعودتك';
	@override String get login => 'تسجيل الدخول';
	@override String get signup => 'إنشاء حساب';
	@override String get haveAccount => 'لديك حساب؟ سجّل الدخول';
	@override String get dontHaveAccount => 'ليس لديك حساب؟ انضم إلينا';
	@override String get verificationMessage => 'أدخل بريدك الإلكتروني لعملية التحقق، وسنرسل إليه رمزاً مكوناً من 4 أرقام.';
	@override String get enterCodeMessage => 'أدخل الرمز المكون من 4 أرقام الذي وصلك على بريدك الإلكتروني.';
	@override String get enterDigitsCode => 'أدخل الرمز المكون من 4 أرقام';
	@override String get setNewPassword => 'عيّن كلمة مرور جديدة لحسابك لتتمكن من تسجيل الدخول والاستفادة من كل المميزات.';
	@override String get resetPassword => 'إعادة تعيين كلمة المرور';
	@override String get updatePassword => 'تحديث كلمة المرور';
}

// Path: onboarding
class _Translations$onboarding$ar implements Translations$onboarding$en {
	_Translations$onboarding$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title1 => 'اعثر على أطباء موثوقين';
	@override String get title2 => 'تواصل مع الخبراء';
	@override String get title3 => 'مواعيد سهلة';
	@override String get description => 'على عكس الاعتقاد السائد، Lorem Ipsum ليس مجرد نص عشوائي. له جذور في قطعة أدبية عمرها أكثر من 2000 عام.';
	@override String get getStarted => 'ابدأ الآن';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appName' => 'Doctor Hunt',
			'common.continueText' => 'متابعة',
			'common.next' => 'التالي',
			'common.skip' => 'تخطي',
			'auth.welcomeMessage' => 'أهلاً بك في Doctor Hunt!',
			'auth.name' => 'الاسم',
			'auth.email' => 'البريد الإلكتروني',
			'auth.password' => 'كلمة المرور الجديدة',
			'auth.confirmPassword' => 'أعد إدخال كلمة المرور',
			'auth.privacyPolicy' => 'أوافق على شروط الخدمة وسياسة الخصوصية',
			'auth.forgotPassword' => 'نسيت كلمة المرور',
			'auth.signUpTitle' => 'انضم إلينا لتبدأ البحث',
			'auth.signUpSubtitle' => 'يمكنك البحث عن الدورات والتقديم عليها والعثور على منح للدراسة بالخارج',
			'auth.signInTitle' => 'مرحباً بعودتك',
			'auth.login' => 'تسجيل الدخول',
			'auth.signup' => 'إنشاء حساب',
			'auth.haveAccount' => 'لديك حساب؟ سجّل الدخول',
			'auth.dontHaveAccount' => 'ليس لديك حساب؟ انضم إلينا',
			'auth.verificationMessage' => 'أدخل بريدك الإلكتروني لعملية التحقق، وسنرسل إليه رمزاً مكوناً من 4 أرقام.',
			'auth.enterCodeMessage' => 'أدخل الرمز المكون من 4 أرقام الذي وصلك على بريدك الإلكتروني.',
			'auth.enterDigitsCode' => 'أدخل الرمز المكون من 4 أرقام',
			'auth.setNewPassword' => 'عيّن كلمة مرور جديدة لحسابك لتتمكن من تسجيل الدخول والاستفادة من كل المميزات.',
			'auth.resetPassword' => 'إعادة تعيين كلمة المرور',
			'auth.updatePassword' => 'تحديث كلمة المرور',
			'onboarding.title1' => 'اعثر على أطباء موثوقين',
			'onboarding.title2' => 'تواصل مع الخبراء',
			'onboarding.title3' => 'مواعيد سهلة',
			'onboarding.description' => 'على عكس الاعتقاد السائد، Lorem Ipsum ليس مجرد نص عشوائي. له جذور في قطعة أدبية عمرها أكثر من 2000 عام.',
			'onboarding.getStarted' => 'ابدأ الآن',
			_ => null,
		};
	}
}
