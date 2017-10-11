
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


Hi there! Welcome to Cloud9 IDE!

To get you started, create some files, play with the terminal,
or visit http://docs.c9.io for our documentation.
If you want, you can also go watch some training videos at
http://www.youtube.com/user/c9ide.

Happy coding!
The Cloud9 IDE team

bundle exec rackup -p $PORT -o $IP

http://ataru-kodaka.hatenablog.com/entry/2014/07/22/212526

http://sounansa.net/archives/647
// フォームを綺麗にまとめる
http://qiita.com/mikuhonda/items/9de7c5ef625d7704da2a

// Sinatra-Activerecord
http://qiita.com/myokkie/items/b6b68b247ec7a110a1c4
http://railsdoc.com/references/rake%20db:migrate
http://qiita.com/zaru/items/cde2c46b6126867a1a64#1-3
http://d.hatena.ne.jp/foosin/20081202/1228223577
http://blog.ruedap.com/2011/04/17/ruby-sinatra-active-record-3-crud

xxx_table_add_column ファイルを作成
>|
class PostsAddActual < ActiveRecord::Migration
  def self.up
      add_column(:posts, :actual, :time, :default=>'')
  end

  def self.down
      ramove_column(:posts, :actual)
  end
end
|<
bundle exec rake db:migrate を実行

// テンプレート
http://www.rubylife.jp/rails/template/index4.html
http://ayaketan.hatenablog.com/entry/20111222/1324555566

// メール送信
http://qiita.com/KitaitiMakoto/items/688d383dc831c8b9a7f9

// Javascript CSS
http://kurukurupapa.hatenablog.com/entry/20121006/1349522062
http://weboook.blog22.fc2.com/blog-entry-329.html
https://syncer.jp/jquery-modal-window
