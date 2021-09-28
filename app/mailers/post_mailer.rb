class PostMailer < ApplicationMailer
    def post_mail(post)
        @post = post
        mail to: "fredagbona@gmail.com", subject: "Un utilisateur a fait un post !"
    end
end
