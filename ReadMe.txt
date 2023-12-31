Pet Gugu & Chichi's Health Manager App
概要

開発言語: Java

統合開発環境 (IDE): Eclipse

データベース: MySQL (XAMPP経由)

/Controller/Login.javaより実行

プロジェクトの構造
このプロジェクトは、DAO（Data Access Object）パターンとMVC（Model-View-Controller）パターンを組み合わせて開発されました。以下は、プロジェクトの主要な構造要素です。

**Model（モデル）:**
- Calender.java: 年月日や月の初日の曜日、月の最終日を取得するためのメソッドを実装しました。
- CatHealth.java: ペットの情報を表すJavaBean。データベースとの対話を処理するためのセッターやゲッターを提供します。

**View（ビュー）:**
- login.jsp: ログイン画面。未記入の確認のみを行います。DBへの接続は実装されていません。
- main.jsp: メイン画面。DBへの書き込みを行うためのソースを取得します。
- resultMonth.jsp: 月次結果画面。DBからデータを読み込み表示します。
- resultCatsOfDay.jsp: 日別詳細画面。メモなど詳細情報を個別に表示する予定です。

**Controller（コントローラ）:**
- Login.java: ログイン画面へ遷移するコントローラ。
- Main.java: IDとPasswordを受け取り、Null判定および空文字の判定を行います。
- ResultMonth.java: DBへの読み書きを行うコントローラ。表示内容を主にこの部分でコントロールします。

**DAO（データアクセスオブジェクト）:**
- CatHealthDao.java: DBへの接続方法を設定します。

ログイン画面とメイン画面のデザインにおいて、Bootstrapを活用しました。

Pet Gugu & Chichi's Health Manager App は、ペットの健康管理をサポートするためのアプリケーションです。このアプリケーションは、ペットの食事と体重をトラッキングし、健康的な生活を促進します。

主な機能
食事トラッキング: 1日の食べたものをリストから選択し、入力することができます。各食事アイテムにはカロリー情報が含まれており、摂取したカロリーが計算されます。

カロリー合計: アプリは選択した食事アイテムのカロリーを合計し、月間のカレンダー形式で摂取カロリーを表示します。これにより、ペットの栄養摂取を追跡できます。

体重トラッキング: ペットの体重を定期的に入力することで、体重の推移を追跡できます。健康状態の変化に敏感に反応できます。

共有機能: アプリを家族や友達と共有することで、ペットの健康管理を協力して行えます。1日のカロリー摂取を管理し、ペットの健康をサポートしましょう。

今後の予定
Pet Gugu & Chichi's Health Manager App は今後さらに多くの機能を追加予定です。以下はいくつかの予定されている機能です。

メモ機能: ペットの日々の出来事や健康状態に関するメモを記録できる機能を追加予定です。獣医への連絡や注意事項を管理しましょう。

体重推移: 体重データの履歴とグラフ表示を追加予定です。ペットの体重変化を視覚的に追跡し、健康状態を把握できます。
