class FeedbackController < ApplicationController
  def index
    FeedbackMailer.with(calling_page: params['calling_page'],name: params['name'],email_address: params['email_address'],body: params[:body],technology_id: params[:technology_id]).feedback_email.deliver_now
    redirect_back(fallback_location: root_path, notice: 'Your feedback has been sent to the editors.')
  end
end
