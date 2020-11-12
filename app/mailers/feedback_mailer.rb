class FeedbackMailer < ApplicationMailer
  def feedback_email
    @calling_page = params[:calling_page]
    @name = params[:name] || 'Anonymous'
    @email_address = params[:email_address] || 'Not provided'
    @body = params[:body]
    if params[:technology_id] && !params[:technology_id].blank?
      @technology = Technology.find(params[:technology_id])
    else
      @technology = nil
    end

    Role.find_by_name('Helpdesk').users.each {|user| mail(to: user.email, subject: 'SComCat Feedback')}
  end
end
