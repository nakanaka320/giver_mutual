# 業務改善アプリ Giver_Mutual
[![Image from Gyazo](https://i.gyazo.com/2972eb172ee289e8542366ca3f2ee253.gif)](https://gyazo.com/2972eb172ee289e8542366ca3f2ee253)

# 概要
- このアプリは自分が働いていた職場の業務を改善させるために考えたアプリです。個々人の業務を円グラフで表示することでチーム全体の業務量を把握することで、チャットを通じてお互いにフォローすることを目的としています。

# 制作背景
- 医療の現場では業務においてIT技術を盛り込むスピードが極めて遅いことから、患者様への治療の遅れや業務効率が悪いことによる人的リソースの無駄使いが多く見られます。病院のシステムを変えることは技術的な面でも裁量的な面でも自身では極めて難しい状態でした。そんな自分でも貢献できることはないのか？そう考えたときに自分の周りの人の業務負担を少しでも減らそうと考え、作り出したアプリです。

# 本番環境 http://18.176.197.53/
### ログイン情報 
#### （テスト用①）
- Eメール :naka@gmail.com
- パスワード :nakanaka

#### （テスト用②）
- Eメール :kimu@gmail.com
- パスワード :nakanaka

***デモ・及び使い方***
# このアプリの操作
[![Image from Gyazo](https://i.gyazo.com/36b6238cd2889a0c88fc5a01503c3f5d.gif)](https://gyazo.com/36b6238cd2889a0c88fc5a01503c3f5d)
#### 会員の新規登録・ログイン機能
- まずは会員登録から新規会員に移ります。そこでアカウントを作成します。この時の所属チームがチャットのメンバーになります。
新規登録、もしくはログインが済んだら本アプリの機能はすべて使えるようになります。

[![Image from Gyazo](https://i.gyazo.com/bbd7bb550e81e542e90942caecbd4874.gif)](https://gyazo.com/bbd7bb550e81e542e90942caecbd4874)
- 会員登録した後は業務登録にて業務の登録を行います。
#### タスク管理機能 
- この時の所要時間に記載する時間をもとにグラフで業務を可視化できるようにしています

[![Image from Gyazo](https://i.gyazo.com/de0a3490279fdc2e22beededb9aeddeb.gif)](https://gyazo.com/de0a3490279fdc2e22beededb9aeddeb)
[![Image from Gyazo](https://i.gyazo.com/16830aba0a2da900705ca8fdd5bcb3de.gif)](https://gyazo.com/16830aba0a2da900705ca8fdd5bcb3de)
#### グラフ表記による仕事量の可視化
#### マウスオーバーによる合計作業時間の表記。
#### またグラフ上の私用・仕事・その他をそれぞれクリックするとグラフが変化します。
- この機能を用いてお互いの業務を管理、チームリーダーなども新しい業務の振り分けの際に利用できる

[![Image from Gyazo](https://i.gyazo.com/9de3f011a6acd1df00e3c96fa3520bff.gif)](https://gyazo.com/9de3f011a6acd1df00e3c96fa3520bff)
#### チャット機能の実装（Ajax使用）
- 相手の状況を把握したチャットが行えるため、最低限のチャットで業務分担が行なえます。

[![Image from Gyazo](https://i.gyazo.com/667dc46c730d9d7667c8823a31883e64.gif)](https://gyazo.com/667dc46c730d9d7667c8823a31883e64)
##### タスクの削除・完了機能

[![Image from Gyazo](https://i.gyazo.com/9b85e358e8e274172bdfb0f48d1d527e.gif)](https://gyazo.com/9b85e358e8e274172bdfb0f48d1d527e)
#### ユーザー情報の編集機能

[![Image from Gyazo](https://i.gyazo.com/cf61124d685a84520d1f78d58b1741e0.gif)](https://gyazo.com/cf61124d685a84520d1f78d58b1741e0)
#### ユーザーの削除機能

# 使用技術（開発環境）

## バックエンド
Ruby on Rails

## フロントエンド
Haml,sass javascript, JQuery, Ajax

## インフラ
AWS(EC2), Capistarano

## Webサーバ
nginx

## アプリケーションサーバ
Unicorn

## ソース管理
Github, GitHubDesktop
## テスト
Rspec（フィーチャースペック,factories使用）
## エディタ
VSCode

# 今後実装したい機能
・dockerによる仮想化環境の作成
・一日の業務を保存、データの集積など行えるように
・掲示板機能の実装

# インストール

git clone https://github.com/nakanaka320/giver_mutual.git

# 作者
 
[nakanaka320] mail to: nakanakamitsuo@icloud.com
 

# DB設計
## memberテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|email|string|null: false|
|password|string|null: false|
|user_name|string|null: false|
|room|references|foreign_key: true|
|cards|integer||
|password|string|null: false|
|administrator|boolean|null: false, default: false|

## Association
- has_many :tasks ,foreign_key: :member_id,dependent::destroy
- has_many :messages ,foreign_key: :member_id,dependent::destroy
- has_many :comments
- belongs_to :room


## roomテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|name|string||
|content|string||

## Association
- has_many :members,dependent: :destroy
- has_many :comments,dependent: :destroy
- has_many :tasks
- has_many :messages


## messageテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|content|string|null: false|
|room|references|foreign_key: true|
|member|references|foreign_key: true|

## Association
- belongs_to :member
- belongs_to :room


## taskテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|title|string|null: false|
|content|string|null: false|
|start_at|datetime|null: false|
|finish_at|datetime|null: false|
|kind|integer|null: false|
|finished|boolean|default: false, null: false|
|member|references|foreign_key: true|
|room|references|foreign_key: true|
|time_required|integer|null: false|

## Association
- belongs_to :member, dependent: :destroy
- belongs_to :room

## commentテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|content|text|null: false|
|member|references|foreign_key: true|
|room|references|foreign_key: true|

## Association
- belongs_to :member
- belongs_to :room
- belongs_to :task