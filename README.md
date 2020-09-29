# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## API動作確認

### ユーザ登録
```
curl -X POST -H 'Content-Type:application/json' \
-d '{"user": {"email":"test@example.com", "password":"password", "password_confirmation":"password"}}' \
localhost:3000/users
```

### ユーザ一覧取得
```
curl -H 'Authorization: Token [トークン]' localhost:3000/users
```

### ログイン
```
curl -X POST -H 'Content-Type:application/json' \
-d '{"user": {"email":"test@example.com", "password":"password"}}' \
localhost:3000/sign_in
```
