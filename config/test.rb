#サーバ上でのアプリケーションコードが設置されているディレクトリを変数に入れておく
app_path = File.expand_path('../../../', __FILE__)  # 「../」が一つ増えている

#アプリケーションサーバの性能を決定する
worker_processes 1

#アプリケーションの設置されているディレクトリを指定
working_directory "#{app_path}/current"  

#Unicornの起動に必要なファイルの設置場所を指定
pid "#{app_path}/shared/tmp/pids/unicorn.pid"  # 「shared」の中を参照するよう変更

#ポート番号を指定
listen "#{app_path}/shared/tmp/sockets/unicorn.sock"  # 「shared」の中を参照するよう変更

#エラーのログを記録するファイルを指定
stderr_path "#{app_path}/shared/log/unicorn.stderr.log"  # 「shared」の中を参照するよう変更

#通常のログを記録するファイルを指定
stdout_path "#{app_path}/shared/log/unicorn.stdout.log"  # 「shared」の中を参照するよう変更
（省略）