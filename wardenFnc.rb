    # ユーザー ID をもとにユーザー情報を取得する
    Warden::Manager.serialize_from_session do |id|
      #{ :name => id, :password => "test" }
      user = get_user(id)
      user.delete(:password)
      return user
    end
    
    # ユーザー情報からセッションに格納する ID を取り出す
    Warden::Manager.serialize_into_session do |user|
      user[:name]
    end
    
    # 認証方式を登録。
    Warden::Strategies.add :login_test do
      # 認証に必要なデータが送信されているか検証
      def valid?
        params["name"] || params["password"]
      end
    
      # 認証
      def authenticate!
    		user = get_user(params['name'].strip)
        if user.nil? || user[:password] != params['password'].strip
          # ユーザー名とパスワードのどちらかでも間違っていたら
          # ログイン失敗
          fail!("Could not log in")
        else
          # ユーザー名とパスワードが正しければログイン成功
          user = {
            :name => params["name"],
            :password => params["password"]
          }
          success!(user)
        end
      end
    end
