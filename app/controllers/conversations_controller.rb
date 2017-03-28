class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.between(pramas[:sender_id], params[:recipiend_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipiend_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end
  
  private
  def conversation_params
    pramas.permit(:sender_id, :recipiend_id)
  end
  
end
