class FeedbackMailer < ApplicationMailer
  def feedback_email
    @recipient = params[:recipient]
    @calling_page = params[:calling_page]
    @name = params[:name] || 'Anonymous'
    @email_address = params[:email_address] || 'Not provided'
    @body = params[:body]
    if params[:technology_id] && !params[:technology_id].blank?
      @technology = Technology.find(params[:technology_id])
    else
      @technology = nil
    end
    mail(to: @recipient, subject: 'SComCat Feedback')
  end
end
