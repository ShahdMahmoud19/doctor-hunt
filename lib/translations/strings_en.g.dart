///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$common$en common = Translations$common$en._(_root);
	late final Translations$auth$en auth = Translations$auth$en._(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en._(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Doctor Hunt'
	String get appName => 'Doctor Hunt';

	/// en: 'Continue'
	String get continueText => 'Continue';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Skip'
	String get skip => 'Skip';
}

// Path: auth
class Translations$auth$en {
	Translations$auth$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome to Doctor Hunt!'
	String get welcomeMessage => 'Welcome to Doctor Hunt!';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'New Password'
	String get password => 'New Password';

	/// en: 'Re-enter Password'
	String get confirmPassword => 'Re-enter Password';

	/// en: 'I agree with the Terms of Service & Privacy Policy'
	String get privacyPolicy => 'I agree with the Terms of Service & Privacy Policy';

	/// en: 'Forgot Password'
	String get forgotPassword => 'Forgot Password';

	/// en: 'Join us to start searching'
	String get signUpTitle => 'Join us to start searching';

	/// en: 'You can search course, apply course and find scholarship for abroad studies'
	String get signUpSubtitle => 'You can search course, apply course and find scholarship for abroad studies';

	/// en: 'Welcome back'
	String get signInTitle => 'Welcome back';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Sign up'
	String get signup => 'Sign up';

	/// en: 'Have an account? Log in'
	String get haveAccount => 'Have an account? Log in';

	/// en: 'Don’t have an account? Join us'
	String get dontHaveAccount => 'Don’t have an account? Join us';

	/// en: 'Enter your email for the verification process, we will send 4 digits code to your email.'
	String get verificationMessage => 'Enter your email for the verification process, we will send 4 digits code to your email.';

	/// en: 'Enter the 4 digits code that you received on your email.'
	String get enterCodeMessage => 'Enter the 4 digits code that you received on your email.';

	/// en: 'Enter 4 Digits Code'
	String get enterDigitsCode => 'Enter 4 Digits Code';

	/// en: 'Set the new password for your account so you can login and access all the features.'
	String get setNewPassword => 'Set the new password for your account so you can login and access all the features.';

	/// en: 'Reset Password'
	String get resetPassword => 'Reset Password';

	/// en: 'Update Password'
	String get updatePassword => 'Update Password';
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Find Trusted Doctors'
	String get title1 => 'Find Trusted Doctors';

	/// en: 'Connect with Experts'
	String get title2 => 'Connect with Experts';

	/// en: 'Easy Appointments'
	String get title3 => 'Easy Appointments';

	/// en: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'
	String get description => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.';

	/// en: 'Get Started'
	String get getStarted => 'Get Started';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appName' => 'Doctor Hunt',
			'common.continueText' => 'Continue',
			'common.next' => 'Next',
			'common.skip' => 'Skip',
			'auth.welcomeMessage' => 'Welcome to Doctor Hunt!',
			'auth.name' => 'Name',
			'auth.email' => 'Email',
			'auth.password' => 'New Password',
			'auth.confirmPassword' => 'Re-enter Password',
			'auth.privacyPolicy' => 'I agree with the Terms of Service & Privacy Policy',
			'auth.forgotPassword' => 'Forgot Password',
			'auth.signUpTitle' => 'Join us to start searching',
			'auth.signUpSubtitle' => 'You can search course, apply course and find scholarship for abroad studies',
			'auth.signInTitle' => 'Welcome back',
			'auth.login' => 'Login',
			'auth.signup' => 'Sign up',
			'auth.haveAccount' => 'Have an account? Log in',
			'auth.dontHaveAccount' => 'Don’t have an account? Join us',
			'auth.verificationMessage' => 'Enter your email for the verification process, we will send 4 digits code to your email.',
			'auth.enterCodeMessage' => 'Enter the 4 digits code that you received on your email.',
			'auth.enterDigitsCode' => 'Enter 4 Digits Code',
			'auth.setNewPassword' => 'Set the new password for your account so you can login and access all the features.',
			'auth.resetPassword' => 'Reset Password',
			'auth.updatePassword' => 'Update Password',
			'onboarding.title1' => 'Find Trusted Doctors',
			'onboarding.title2' => 'Connect with Experts',
			'onboarding.title3' => 'Easy Appointments',
			'onboarding.description' => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
			'onboarding.getStarted' => 'Get Started',
			_ => null,
		};
	}
}
