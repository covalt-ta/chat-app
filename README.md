# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name  | string | null: false |

## room_users テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| room_id | integer | null: false, foreign_key: true |

## messages テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| content | string  |
| user_id | integer | null: false, foreign_key: true |
| room_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user