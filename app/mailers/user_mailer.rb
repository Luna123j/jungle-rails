class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email
    @user = params[:user]
    @order = params[:order]
    @url  = 'http://0.0.0.0:3000/'
    mail(to: @user.email, subject: "Jungle order #{@order.id} has been created")
  end
end
