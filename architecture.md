# Flutter アプリケーションアーキテクチャガイド (Riverpod & Dio)

## プロジェクト構造

```
/lib
  ├── main_development.dart   # 開発環境エントリーポイント
  ├── main_staging.dart       # ステージング環境エントリーポイント
  ├── main.dart               # プロダクション環境エントリーポイント
  ├── config/                 # アプリケーション設定
  │   ├── assets.dart         # アセットパス定義
  │   └── dependencies.dart   # 依存性設定
  ├── data/                   # データ層
  │   ├── repositories/       # リポジトリ実装
  │   │   ├── feature_a/
  │   │   ├── auth/
  │   │   ├── feature_b/
  │   │   ├── feature_c/
  │   │   └── ...
  │   └── services/           # 外部サービス接続
  │       ├── shared_preferences_service.dart
  │       ├── api/            # APIサービス (Dio)
  │       └── local/          # ローカルデータサービス
  ├── domain/                 # ドメイン層
  │   ├── models/             # ドメインモデル
  │   │   ├── feature_a/
  │   │   ├── feature_b/
  │   │   ├── feature_c/
  │   │   └── ...
  │   └── use_cases/          # ビジネスロジック
  ├── routing/                # ルーティング
  │   ├── router.dart         # アプリルーター (GoRouter)
  │   └── routes.dart         # ルート定義
  ├── ui/                     # プレゼンテーション層
  │   ├── feature_a/          # 機能A関連UI
  │   │   ├── providers/      # Riverpodプロバイダー
  │   │   ├── screens/        # 画面ウィジェット
  │   │   └── widgets/        # 機能固有のウィジェット
  │   ├── auth/               # 認証関連UI
  │   ├── feature_b/          # 機能B関連UI
  │   ├── core/               # 共通UI要素
  │   │   ├── localization/   # 多言語対応
  │   │   ├── themes/         # テーマ設定
  │   │   └── ui/             # 共通ウィジェット
  │   └── ...
  └── utils/                  # ユーティリティ
      ├── result.dart         # 結果ラッパー (Ok/Error)
      ├── image_error_listener.dart
      └── ...
```

## アーキテクチャの概要

このアプリケーションは**クリーンアーキテクチャ**の原則に従い、関心事の分離と層の独立性を重視しています。**Riverpod**による状態管理と**Dio**による API 通信を採用しています。

## 各層の責務

### 1. データ層 (Data Layer)

データの取得、保存、変換を担当します。

#### リポジトリ実装

```dart
class FeatureARepositoryImpl implements FeatureARepository {
  final DioClient _dioClient;
  final SharedPreferencesService _prefsService;

  FeatureARepositoryImpl(this._dioClient, this._prefsService);

  @override
  Future<Result<List<FeatureAItem>>> getByCategory(String categoryRef) async {
    try {
      final response = await _dioClient.get('/categories/$categoryRef/items');
      final items = (response.data as List)
          .map((json) => FeatureAItem.fromJson(json))
          .toList();
      return Result.ok(items);
    } catch (e) {
      return Result.error(e);
    }
  }
}
```

#### API サービス (Dio)

```dart
class DioClient {
  final Dio _dio;
  final AuthTokenProvider _tokenProvider;

  DioClient(this._dio, this._tokenProvider) {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _tokenProvider.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          // 認証エラー処理等
          return handler.next(error);
        }
      )
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) {
    return _dio.get(path, queryParameters: queryParams);
  }

  // post, put, delete等の他のメソッド
}
```

### 2. ドメイン層 (Domain Layer)

アプリケーションのビジネスロジックとルールを定義します。

#### モデル

```dart
@freezed
class FeatureAItem with _$FeatureAItem {
  const factory FeatureAItem({
    required String name,
    required String description,
    required String locationName,
    required int duration,
    required TimeOfDay timeOfDay,
    required bool isSpecial,
    required int price,
    required String categoryRef,
    required String ref,
    required String imageUrl,
  }) = _FeatureAItem;

  factory FeatureAItem.fromJson(Map<String, Object?> json) =>
      _$FeatureAItemFromJson(json);
}
```

#### リポジトリインターフェース

```dart
abstract class FeatureARepository {
  Future<Result<List<FeatureAItem>>> getByCategory(String categoryRef);
}
```

#### ユースケース

```dart
class GetFeatureAItemsUseCase {
  final FeatureARepository _repository;

  GetFeatureAItemsUseCase(this._repository);

  Future<Result<List<FeatureAItem>>> execute(String categoryRef) {
    return _repository.getByCategory(categoryRef);
  }
}
```

### 3. プレゼンテーション層 (UI Layer)

ユーザーインターフェースとユーザーとのインタラクションを担当します。**Riverpod**を使用した状態管理を採用しています。

#### プロバイダー (Riverpod)

```dart
// リポジトリプロバイダー
final featureARepositoryProvider = Provider<FeatureARepository>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  final prefsService = ref.watch(sharedPreferencesServiceProvider);
  return FeatureARepositoryImpl(dioClient, prefsService);
});

// ユースケースプロバイダー
final getFeatureAItemsUseCaseProvider = Provider<GetFeatureAItemsUseCase>((ref) {
  return GetFeatureAItemsUseCase(ref.watch(featureARepositoryProvider));
});

// 状態管理
class FeatureAState {
  final List<FeatureAItem> daytimeItems;
  final List<FeatureAItem> eveningItems;
  final Set<String> selectedItems;
  final bool isLoading;
  final Object? error;

  // コンストラクタとcopyWithメソッド
}

class FeatureANotifier extends StateNotifier<FeatureAState> {
  final GetFeatureAItemsUseCase _getFeatureAItemsUseCase;
  final ConfigRepository _configRepository;

  FeatureANotifier(this._getFeatureAItemsUseCase, this._configRepository)
      : super(const FeatureAState()) {
    loadItems();
  }

  Future<void> loadItems() async {
    state = state.copyWith(isLoading: true);

    final configResult = await _configRepository.getConfig();
    if (configResult is Error) {
      state = state.copyWith(isLoading: false, error: configResult.error);
      return;
    }

    final categoryRef = configResult.value.category;
    if (categoryRef == null) {
      state = state.copyWith(
        isLoading: false,
        error: Exception('Category not found')
      );
      return;
    }

    final result = await _getFeatureAItemsUseCase.execute(categoryRef);

    if (result is Ok) {
      final items = result.value;
      final daytimeItems = items.where(
        (item) => [TimeOfDay.any, TimeOfDay.morning, TimeOfDay.afternoon]
            .contains(item.timeOfDay)
      ).toList();

      final eveningItems = items.where(
        (item) => [TimeOfDay.evening, TimeOfDay.night]
            .contains(item.timeOfDay)
      ).toList();

      state = state.copyWith(
        daytimeItems: daytimeItems,
        eveningItems: eveningItems,
        isLoading: false
      );
    } else {
      state = state.copyWith(isLoading: false, error: result.error);
    }
  }

  void addItem(String itemRef) {
    final updatedSelection = Set<String>.from(state.selectedItems)..add(itemRef);
    state = state.copyWith(selectedItems: updatedSelection);
  }

  void removeItem(String itemRef) {
    final updatedSelection = Set<String>.from(state.selectedItems)..remove(itemRef);
    state = state.copyWith(selectedItems: updatedSelection);
  }

  Future<Result<void>> saveItems() async {
    state = state.copyWith(isLoading: true);

    final configResult = await _configRepository.getConfig();
    if (configResult is Error) {
      state = state.copyWith(isLoading: false, error: configResult.error);
      return configResult;
    }

    final config = configResult.value;
    final result = await _configRepository.setConfig(
      config.copyWith(items: state.selectedItems.toList())
    );

    state = state.copyWith(
      isLoading: false,
      error: result is Error ? result.error : null
    );

    return result;
  }
}

// プロバイダー
final featureAProvider = StateNotifierProvider<FeatureANotifier, FeatureAState>((ref) {
  return FeatureANotifier(
    ref.watch(getFeatureAItemsUseCaseProvider),
    ref.watch(configRepositoryProvider)
  );
});
```

#### 画面

```dart
class FeatureAScreen extends ConsumerWidget {
  const FeatureAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(featureAProvider);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.error != null) {
      return Scaffold(
        body: Center(
          child: ErrorIndicator(
            message: LocaleText.of(context).errorLoadingData,
            onRetry: () => ref.read(featureAProvider.notifier).loadItems(),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(LocaleText.of(context).featureATitle)),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                if (state.daytimeItems.isNotEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(LocaleText.of(context).daytime),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = state.daytimeItems[index];
                        return ItemListTile(
                          item: item,
                          isSelected: state.selectedItems.contains(item.ref),
                          onToggle: (selected) {
                            if (selected) {
                              ref.read(featureAProvider.notifier).addItem(item.ref);
                            } else {
                              ref.read(featureAProvider.notifier).removeItem(item.ref);
                            }
                          },
                        );
                      },
                      childCount: state.daytimeItems.length,
                    ),
                  ),
                ],

                if (state.eveningItems.isNotEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(LocaleText.of(context).evening),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = state.eveningItems[index];
                        return ItemListTile(
                          item: item,
                          isSelected: state.selectedItems.contains(item.ref),
                          onToggle: (selected) {
                            if (selected) {
                              ref.read(featureAProvider.notifier).addItem(item.ref);
                            } else {
                              ref.read(featureAProvider.notifier).removeItem(item.ref);
                            }
                          },
                        );
                      },
                      childCount: state.eveningItems.length,
                    ),
                  ),
                ],
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleText.of(context).selected(state.selectedItems.length),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  FilledButton(
                    onPressed: state.selectedItems.isEmpty
                        ? null
                        : () => ref.read(featureAProvider.notifier).saveItems(),
                    child: Text(LocaleText.of(context).confirm),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

### 4. ルーティング

GoRouter を使用したルーティング管理を実装しています。

```dart
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/feature-a',
      builder: (context, state) {
        return const FeatureAScreen();
      },
    ),
    GoRoute(
      path: '/feature-b',
      builder: (context, state) {
        return const FeatureBScreen();
      },
    ),
    GoRoute(
      path: '/feature-c/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return FeatureCDetailsScreen(itemId: id);
      },
    ),
  ],
);
```

### 5. 共通要素

#### 多言語対応

```dart
class LocaleText {
  static LocaleText of(BuildContext context) =>
      Localizations.of<LocaleText>(context, LocaleText)!;

  String get featureATitle => _get('featureATitle');
  String get daytime => _get('daytime');
  String get evening => _get('evening');
  String get confirm => _get('confirm');
  String get errorLoadingData => _get('errorLoadingData');

  String selected(int count) => _get('selected').replaceAll('{0}', '$count');

  // 実装省略
}
```

#### テーマ

```dart
abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: AppColors.lightColorScheme,
    textTheme: _textTheme,
    // その他の設定
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    // その他の設定
  );

  // 実装省略
}
```

#### 結果ハンドリング

```dart
sealed class Result<T> {
  const Result();

  factory Result.ok(T value) = Ok<T>;
  factory Result.error(Object error, [StackTrace? stackTrace]) = Error<T>;

  R when<R>({
    required R Function(T value) ok,
    required R Function(Object error, StackTrace? stackTrace) err,
  });
}

class Ok<T> extends Result<T> {
  final T value;
  const Ok(this.value);

  @override
  R when<R>({
    required R Function(T value) ok,
    required R Function(Object error, StackTrace? stackTrace) err,
  }) => ok(value);
}

class Error<T> extends Result<T> {
  final Object error;
  final StackTrace? stackTrace;
  const Error(this.error, [this.stackTrace]);

  @override
  R when<R>({
    required R Function(T value) ok,
    required R Function(Object error, StackTrace? stackTrace) err,
  }) => err(error, stackTrace);
}
```
