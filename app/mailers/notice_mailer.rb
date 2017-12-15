class NoticeMailer < ApplicationMailer

  # 引数としてblogを追加します。
  def sendmail_blog(blog)
    @blog = blog

    mail to: "kaikyogoku@gmail.com",
         subject: '【Achieve】ブログが投稿されました'
  end
end
