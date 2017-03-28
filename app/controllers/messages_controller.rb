class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end
  
  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = ture
      @messages = @messages[-10..-1]
    end
    
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end
    @messages = @conversation.messages.build
  end
    
    
  def create
    @messages = @conversation.messages.build(messages_params)
    if @messages.save
      redirect_to conversation_messages_path(@conversation)
    end
  end
  
  private
  def messages_params
    pramas.require(:messages).permit(:body, :user_id)
  end
  
end
