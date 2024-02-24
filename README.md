# Suumo Scraping Example
スーモのサイトをスクレイピングして、賃料＋管理費が10万円以下の下記データをDBに保存。
- タイトル（建物名）
- 賃料
- 管理費

## 動作環境
- Ruby 3.1
- Ruby on Rails 7.0
- MySQL 8.0
- PlanetScale

## 使い方
[SCRAPING_URL](https://github.com/heromoon9218/suumo-scraping/blob/0e9b362f8adc4fc0e2b2edb04af166f73905501c/app/services/suumo_scraper.rb#L7)の値をスクレイピング対象ページのURLに編集する。

`app/services/suumo_scraper.rb`
```ruby
SCRAPING_URL = #スクレイピング対象のSUUMO検索結果ページのURL
```

下記コマンドでスクリプトを実行する。
```bash
bin/rails runner "lib/scripts/scrape_and_save_properties.rb"
```
