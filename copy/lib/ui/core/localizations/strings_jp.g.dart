///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsJp implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJp({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.jp,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <jp>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJp _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsSampleJp sample = _TranslationsSampleJp._(_root);
}

// Path: sample
class _TranslationsSampleJp implements TranslationsSampleEn {
	_TranslationsSampleJp._(this._root);

	final TranslationsJp _root; // ignore: unused_field

	// Translations
	@override String get title => 'サンプル';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsJp {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'sample.title': return 'サンプル';
			default: return null;
		}
	}
}

