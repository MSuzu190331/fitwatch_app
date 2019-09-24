# アプリ説明
時計のコーディネイトおよびレビュー投稿アプリです。
以下アプリの参照画像になります。（設計段階のイメージのため変更あり）

- DB設計
![Database ER Diagram Example (Crow's Foot)](https://user-images.githubusercontent.com/49112822/65482771-0da79e80-ded5-11e9-8af5-87e4f4392a84.jpeg)

- トップページ
<img width="551" alt="fitwatch-design3" src="https://user-images.githubusercontent.com/49112822/65421229-329d0280-de3e-11e9-867c-f98583f5faf7.png">

- 一覧ページ
<img width="549" alt="fitwatch-design" src="https://user-images.githubusercontent.com/49112822/65421631-2b2a2900-de3f-11e9-881a-8476ffb08b33.png">

- 投稿ページ
<img width="549" alt="fitwatch-design2" src="https://user-images.githubusercontent.com/49112822/65421651-3bda9f00-de3f-11e9-88d1-775ebafbbe4c.png">



# アプリのURL
https://fit-watch-app.herokuapp.com/

# 開発環境
Ruby、JavaScript、Ruby on Rails、VScode、MySQL（開発環境）、PostgreSQL（本番環境）、moqups、Lucidchart、MacOS

# 使い方概要
- テストユーザー向けのアカウント
  - メースアドレス： test@com
  - パスワード： 7777777
- rankingは投稿されたものをいいねが多い順に表示。
- itemは投稿されたものを新しい順に全て表示。
- postは自分が投稿する機能。
- ニックネーム（テストアカウントの場合はtestと表示）が表示されているところはマイページで、投稿したものといいねしたものが確認できる。
- logoutはユーザーをログアウトできる。

# 実装済み機能
- ユーザー機能（ログイン・ログアウト）
- 投稿、編集、削除機能
- いいね機能（詳細ページにてハートをクリック）
- ランキング機能（いいねの多い順表示）

# 実装予定機能
- SNS認証
- カテゴリー別機能検索
- 検索機能
- コメント機能

