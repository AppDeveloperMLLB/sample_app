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
- usecase
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





