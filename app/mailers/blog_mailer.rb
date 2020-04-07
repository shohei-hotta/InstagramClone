class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog
    mail to: "sho1127-cal@kra.biglobe.ne.jp", subject: "投稿の確認メール"
  end
end
