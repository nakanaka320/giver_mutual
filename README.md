# 業務改善アプリ Giver_Mutual
[![Image from Gyazo](https://i.gyazo.com/2972eb172ee289e8542366ca3f2ee253.gif)](https://gyazo.com/2972eb172ee289e8542366ca3f2ee253)

# 概要
- このアプリは自分が働いていた職場の、業務を改善させるために考えたアプリです。個々人の業務を円グラフで表示することでチーム全体の業務量を把握することで、チャットを通じてお互いにフォローすることを目的としています。

# 制作背景
- 医療の現場では業務においてIT技術を盛り込むスピードが極めて遅いことから、患者様への治療の遅れや業務効率が悪いことによる人的リソースの無駄使いが多く見られます。病院のシステムを変えることは技術的な面でも裁量的な面でも自身では極めて難しい状態でした。そんな自分でも何かできることはないのか？そう考えたときに自分の周りの人の業務負担を少しでも減らそうと考え、作り出したアプリです。

# 本番環境 http://18.176.197.53/
### ログイン情報 （テスト用）
- Eメール :naka@gmail.com
- パスワード :nakanaka

***デモ・及び使い方***
# このアプリの操作
[![Image from Gyazo](https://i.gyazo.com/36b6238cd2889a0c88fc5a01503c3f5d.gif)](https://gyazo.com/36b6238cd2889a0c88fc5a01503c3f5d)

- まずは会員登録から新規会員に移ります。そこでアカウントを作成します。この時の所属チームがチャットのメンバーになります。

[![Image from Gyazo](https://i.gyazo.com/bbd7bb550e81e542e90942caecbd4874.gif)](https://gyazo.com/bbd7bb550e81e542e90942caecbd4874)
- 会員登録した後は業務登録にて業務の登録を行います。

[![Image from Gyazo](https://i.gyazo.com/de0a3490279fdc2e22beededb9aeddeb.gif)](https://gyazo.com/de0a3490279fdc2e22beededb9aeddeb)
- 登録した後は、チャット画面右側のOPENラベルから円グラフで業務量を見ることが出来ます。


- 登録した業務は完了にも出来ます。

[![Image from Gyazo](https://i.gyazo.com/9b85e358e8e274172bdfb0f48d1d527e.gif)](https://gyazo.com/9b85e358e8e274172bdfb0f48d1d527e)
- 編集機能

[![Image from Gyazo](https://i.gyazo.com/cf61124d685a84520d1f78d58b1741e0.gif)](https://gyazo.com/cf61124d685a84520d1f78d58b1741e0)
- 削除機能



# 機能
 
- 機能1 自身のタスク管理
- 機能2 他人のタスクを円グラフで直感的に理解できる
- 機能3 相手の状況を把握した上でコミュニケーションを行える
 
# インストール

git clone https://github.com/nakanaka320/giver_mutual.git

# 作者
 
[nakanaka320] mail to: nakanakamitsuo@icloud.com
 
# ライセンス
 
[MIT](http://github.com/nakanaka320.mit-license.org)</blockquote>


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