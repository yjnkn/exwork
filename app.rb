require 'bundler'
Bundler.require

module MyBbs
  # DBアクセス用module
  class Post < ActiveRecord::Base
  end
  
  class Application < Sinatra::Base
    configure do
      register Sinatra::Reloader
      enable :sessions
      include ERB::Util
      register Sinatra::ActiveRecordExtension
      set :database, {adapter: "sqlite3", database: "db/bbs.db"}
    end
    
    helpers do
      def warden
        request.env["warden"]
      end
    	def login_user
    		warden.user
    	end
    end
    
    # Warden の設定
    use Warden::Manager do |manager|
      # 先ほど登録したカスタム認証方式をデフォルトにする
      manager.default_strategies :login_test
    
      # 認証に失敗したとき呼び出す Rack アプリを設定(必須)
      manager.failure_app = Sinatra::Application
    end

    ################
    # routing
    # ログインしていないときは、ログインフォームを表示。
    # ログインしているときは、ログイン済ページを表示。
    get "/" do
      if warden.user.nil?
        erb :login
      else
        #erb :success_login
        redirect "/#{login_user[:id]}"
      end
    end
    
    # 認証を実行する。
    # 成功すればトップページに移動。
    post "/login" do
      warden.authenticate!
      redirect "/"
    end

    # 認証に失敗したとき呼ばれるルート。
    # ログイン失敗ページを表示してみる。
    post "/unauthenticated" do
      erb :fail_login
    end
    
    # ログアウトする。
    # ログアウト後はトップページに移動。
    get "/logout" do
      warden.logout
      redirect "/"
    end
    
    post "/exwork" do
      # DB登録
      exwork = MyBbs::Post.new(
        :userid=>login_user[:id],
        :workday=>params[:workDay],
        :extime=>params[:workTime],
        :extype=>params[:workType])
      exwork.save
      redirect "/"
    end
    
    post "/actwork" do
      puts("actid:#{params[:actid]}  actWork:#{params[:actWork]}")
      actwork = MyBbs::Post.where(:id => params[:actid]).first
      actwork.actual = params[:actWork]
      actwork.save
      redirect "/"
    end
    
    get "/:name" do |n|
      if n != login_user[:id]
        redirect "/"
      else
        @user = login_user[:name]
        erb :table
      end
    end
  end
end
