FROM nginx:1.18.0
# include用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*
# Nginxの設定ファイルをコンテナにコピー
ADD nginx.conf /etc/nginx/conf.d/app.conf
# ビルド完了後にNginxを起動
# コマンドをforgroundで動かさないとコンテナが停止してしまうため、daemonをoff
# -cでconfigファイルを指定
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
EXPOSE 80