=begin
https://www.inetweb.co.jp/wmail/
＜申請＞
２０１４／１２／１０（水）　１８：３０～２０：００（０１：３０）

http://www.school.ctc-g.co.jp/columns/masuidrive/masuidrive07.html
=end
mail = Mail.new do
  from    login_user[:mail_address]
  to      login_user[:send_address]
  subject '残業申請'
  body    'There is a body.'
end

mail.delivery_method :smtp, { address:   'mail.inetweb.co.jp',
                              port:      587,
                              domain:    'domain',
                              user_name: 'youserid',
                              password:  'password' }
mail.deliver!