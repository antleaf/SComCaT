class AdminController < ApplicationController

  def index
    authorize self
  end
end
