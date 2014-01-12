class ConversationsController < ApplicationController
helper_method :mailbox, :conversation
	def index
		@conversations = current_user.mailbox.conversations
		
		
	end
	
	def new
	@conversation ||= mailbox.conversations.new
	end
	
	def create
	@conversation ||= mailbox.conversations.new
	if params[:receipient].empty? || params[:subject].empty? || params[:message].empty?
		if params[:receipient].empty?
			@conversation.errors.add(:receipient, t(".error.mail_not_found"))
		end
		if params[:subject].empty?
			@conversation.errors.add(:subject, t(".error.mail_not_found"))
		end
		if params[:message].empty?
			@conversation.errors.add(:message, t(".error.mail_not_found"))
		end
			render 'new'
	else
		receipient_emails = params[:receipient].gsub(/\s+/, "").split(',')
	    receipients = User.where(email: receipient_emails).to_a
	    logger.debug receipients
		current_user.send_message(receipients, params[:message], params[:subject])
		redirect_to conversations_path
	end
	end
	
	def trash
    conversation.move_to_trash(current_user)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end
	
	
	def reply
    	current_user.reply_to_conversation(conversation, params[:message])
		redirect_to conversation
  end
	
	private
	
def conversation_params
			params.fetch(:receipient, :subject, :message, :name)
		end
		
		
		 def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
end
