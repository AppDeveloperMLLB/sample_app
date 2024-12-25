.PHONY: setup
setup:
	fvm flutter clean
	fvm flutter pub get

flutter_setup:
	fvm flutter pub add --dev build_runner
	# flutterの日本語化対応用
	# fvm flutter pub add intl:any
	# fvm flutter pub add flutter_localizations --sdk=flutter
	# # マルチスクリーン対応
	# fvm flutter pub add flutter_screenutil
	# 多言語化対応
	# fvm flutter pub add slang
	# fvm flutter pub add slang_flutter
	# fvm flutter pub add --dev slang_build_runner
	# mkdir assets/i18n
	# touch assets/i18n/strings.i18n.yaml
	# touch assets/i18n/strings_jp.i18n.yaml
	# touch slang.yaml
	# echo "input_directory: assets/i18n\ninput_file_pattern: .i18n.yaml\noutput_directory: lib/i18n" > slang.yaml
	# Riverpod
	fvm flutter pub add flutter_hooks
	fvm flutter pub add hooks_riverpod
	fvm flutter pub add riverpod_annotation
	fvm flutter pub add --dev riverpod_generator
	# If you use riverpod_lint, uncomment the following
	# fvm flutter pub add --dev riverpod_lint
	# fvm flutter pub add --dev custom_lint
	# And add the following to the analysis_options.yaml file
	# analyzer:
	#   plugins:
	#     - custom_lint
	# Freezed
	fvm flutter pub add freezed_annotation
	fvm flutter pub add json_annotation
	fvm flutter pub add --dev freezed
	fvm flutter pub add --dev json_serializable
	# GoRouter
	# fvm flutter pub add go_router
	# fvm flutter pub add --dev go_router_builder
	# FlutterGen
	# fvm flutter pub add --dev flutter_gen_runner
	# echo "flutter_gen:\n  output: lib/gen/\n  line_length: 80\n  colors:\n    inputs:\n     - assets/color/colors.xml" >> pubspec.yaml

generate:
	fvm flutter clean
	fvm flutter pub get
	# l10nの生成コマンド
	# flutter gen-l10n
	# コード生成(build_runner)
	fvm dart run build_runner build --delete-conflicting-outputs

build_runner:
	fvm dart run build_runner build --delete-conflicting-outputs

submit_ios:
	fvm flutter clean
	fvm flutter pub get
	#Xcodeを開く
	open ios/Runner.xcworkspace

submit_android:
	fvm flutter clean
	fvm flutter pub get
	#AndroidのBundleを生成する
	fvm flutter build appbundle

lint:
	fvm flutter analyze

custom_lint:
	fvm dart run custom_lint

lint_fix:
	fvm flutter analyze --fix

format:
	fvm flutter format lib