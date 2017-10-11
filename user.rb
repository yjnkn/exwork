# coding: UTF-8

USERS = {
	'taro'   => {:id => 'taro', :name => '太郎', :password => 'password1',
				 :mail_address => 'taro@ownway.info',   :send_address => 'taro@ownway.info',},
	'jiro'   => {:id => 'jiro', :name => '二郎', :password => 'password2',
				 :mail_address => 'jiro@ownway.info',   :send_address => 'taro@ownway.info',},
	'saburo' => {:id => 'sabu', :name => '三郎', :password => 'password3',
				 :mail_address => 'suburo@ownway.info', :send_address => 'taro@ownway.info',},
	'0125'   => {:id => '0125', :name => '中野悠二', :password => 'password',
				 :mail_address => 'y-nakano@inetweb.co.jp', :send_address => 'y-nakano@inetweb.co.jp',},
}

def get_user(username)
	return USERS.key?(username) ? USERS[username].clone : nil
end
