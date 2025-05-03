# sample_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Architecture
大分類として、coreとfeaturesに分けている
- core: 全体で共通して使うものをここに配置
- features: 機能ごとに分けてフォルダを作成している

### core
coreには以下を配置
- data
api, shared_preferencesなどの外部機能を提供するコードを配置
apiで具体例を出すと、dioの設定とdioのプロバイダーを配置する
dioを使って、実際のapiを実行するコードはfeatures側のrepositoryに配置する
- exception
例外のクラスを配置
- presentation
画面表示に関するコードを配置
- router
画面遷移に関するコードを配置
- utils
共通で使う補助的なコードを配置

### features
features配下には、機能ごとのフォルダを作成
機能ごとのフォルダ間で制限は設けない。
例えば、　homeフォルダのコードからuserフォルダのコードを呼び出すことも可能
機能ごとのフォルダには以下を配置
- data
データの永続化やデータを取得するrepositoryのコードと、その際に使用するモデルのコードを配置（例えば、APIレスポンスのモデルなど）
- domain
データクラスや、ビジネスロジックを配置
- presentation
画面表示に関するコードを配置
- use_case
presentationからdataのコードを実行し、データのCRUDを行うが、その時に、処理が複数必要な場合や複雑な場合は、usecaseを間に挟む
例えば、データの更新するかしないかの判断を行ったり、データの取得を行った後、取得したデータを使って更新が必要だったり、一つのCRUDだけで完結しない場合は使用する

#### presentation
featuresのpresentationには以下を配置
- components
機能ごとの汎用的なコンポーネントを配置
- pages
各画面のコードを配置
- provider
Riverpodのproviderを配置





# テストから設計を考えてみる

# Architecture

Flutter のドキュメントのアーキテクチャを参考にしている
https://docs.flutter.dev/app-architecture

##

```
lib
|____ui
| |____core
| | |____ui
| | | |____<shared widgets>
| | |____themes
| |____<FEATURE NAME>
| | |____view_model
| | | |_____<view_model class>.dart
| | |____widgets
| | | |____<feature name>_screen.dart
| | | |____<other widgets>
|____domain
| |____models
| | |____<model name>.dart
|____data
| |____repositories
| | |____<repository class>.dart
| |____services
| | |____<service class>.dart
| |____model
| | |____<api model class>.dart
|____config
|____utils
|____routing
|____main_staging.dart
|____main_development.dart
|____main.dart

// The test folder contains unit and widget tests
test
|____data
|____domain
|____ui
|____utils

// The testing folder contains mocks other classes need to execute tests
testing
|____fakes
|____models
```

# Data

## Repository

Service を呼び出して、以下のことを行う

- エラー処理
- データの更新
- データの取得
- 取得したデータを Domain の Model に変換

## Service

必要なデータがアプリケーションの Dart コードの外部にある場合、サービスを使う

- iOS や Android API などの基盤となるプラットフォーム
- REST エンドポイント
- ローカルファイル
- データベース

## Provider

データの取得に関しては、Riverpod の機能を使用した方がテストが書きやすく、キャッシュも楽なため、Provider を設ける  
データ取得時の流れとしては以下になる  
Service -> Repository -> Provider -> ViewModel or UI

# Domain

## Model

ビジネスロジックを含むモデルクラス

## UseCase

主に、ViewModel 内に存在するビジネスロジックをカプセル化するために使用され、次の条件の 1 つ以上を満たす場合使用が推奨されます。

- 複数のリポジトリからのデータのマージが必要
- 非常に複雑である
- ロジックが異なる ViewModel で再利用される場合

### UseCase は必須か？

UseCase はオプションとします。  
つまり、基本的には、ViewModel から直接 Repository を使ってデータの取得・更新を行うのを推奨します。

# UI

## ViewModel

UI の状態を管理する  
具体的には以下の役割を持つ

- Repository、または、Provider からデータを取得し、View での表示に適した形式に変換する（たとえば、データのフィルタリング、並べ替え、集計などを行います）
- View で必要な現在の状態を維持して、データを失うことなく View を再構築できるようにします
- ボタンの押下やフォームの送信などのイベント ハンドラーにアタッチできるコールバックを View に公開します

### ViewModel は必須か？

各画面で、基本的には使うことになると思う。  
しかし、単純にデータをとってきて表示するだけの画面の場合は、ViewModel を使わず、直接 Provider を使っても問題ない

## View

Widget で表示を実装する  
ビジネスロジックは含めず、以下の簡単なロジックのみが含まれる

- ビューモデルのフラグまたは null 許容フィールドに基づいてウィジェットを表示または非表示にする単純な if ステートメント
- アニメーションロジック
- 画面サイズや向きなどのデバイス情報に基づいたレイアウト ロジック
- シンプルなルーティングロジック
