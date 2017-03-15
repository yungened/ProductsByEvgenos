class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(messages_params)
    @message.product = Product.find(params[:product_id])

    if(@message.save)
      redirect_to @message.product
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to @message.product
  end

  private def messages_params
    params.require(:message).permit(:content)
  end
end
