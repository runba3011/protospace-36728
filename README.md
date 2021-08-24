# テーブル設計

## usersテーブル

|column     |Type   |Options     |
|-----------|-------|------------|
|email      |string |null: false |
|password   |string |null: false |
|name       |string |null: false |
|profile    |text   |null: false |
|occupation |text   |null: false |
|position   |text   |null: false |

- has_many :prototypes
- has_many :comments


## commentsテーブル

|column   |Type      |Options                      |
|---------|----------|-----------------------------|
|text     |text      |null: false                  |
|user     |references|null: false,foreign_key: true|
|prototype|references|null: false,foreign_key: true|

- belongs_to :user
- belongs_to :prototypes


## prototypesテーブル

|column    |Type          |Options                      |
|----------|--------------|-----------------------------|
|title     |string        |null: false                  |
|catch_copy|text          |null: false                  |
|concept   |text          |null: false                  |
|image     |Active Storage|                             |
|user      |references    |null: false,foreign_key: true|