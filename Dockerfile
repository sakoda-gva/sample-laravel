# ベースイメージ
FROM php:8.0-apache

# アプリケーションのルートディレクトリを設定
WORKDIR /var/www/html/DockerTest

# 必要なソフトウェアをインストール
RUN apt-get update -y \
    && apt-get install -y \
        git \
        zip \
        unzip \
        libzip-dev \
    && docker-php-ext-install zip

# Composerのインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# アプリケーションのファイルをコピー
COPY . /var/www/html/DockerTest

# Composerで依存関係をインストール
RUN composer install

# アプリケーションの設定を行う
RUN cp .env.example .env \
    && php artisan key:generate

# ポートの設定
EXPOSE 8000

# アプリケーションを起動するためのコマンド
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000"]
