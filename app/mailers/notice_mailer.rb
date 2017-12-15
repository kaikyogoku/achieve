class NoticeMailer < ApplicationMailer

  # 引数としてblogを追加します。
  def sendmail_blog(blog)
    @blog = blog

    mail to: "kai-kyo@nttpc.co.jp",
         subject: '【Achieve】ブログが投稿されました'
  end
end
