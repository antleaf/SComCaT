class EditorialController < ApplicationController
  def index
    authorize self
    begin
      @draft_technologies = EditorialState.friendly.find('draft').technologies
      # @draft_technologies = Technology.draft
    rescue

      @draft_technologies = []
    end
    respond_to do |format|
      format.html
    end
  end
end
