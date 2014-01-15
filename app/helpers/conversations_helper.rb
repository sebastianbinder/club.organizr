module ConversationsHelper
 def get_receipients
 	if !@mails.nil?
		return @mails
	elsif !params[:receipient].nil?
		return params[:receipient]
    end
  end
end
