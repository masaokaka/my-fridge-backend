## 冷蔵庫アプリのバックエンドプロジェクト
### 起動
```
docker-compose up -d
```
### パッケージ追加時
- **追加する人**
1. apiコンテナのシェルにアクセス
```
docker-compose exec -it api sh
```
2. パッケージついか
```
go get 追加したいパッケージ
```
3. gitにpush
- **その他の人**
1. ローカルのソースを最新化
2. apiコンテナのシェルにアクセス
```
docker-compose exec -it api sh
```
3. パッケージのダウンロード
```
go mod download
```