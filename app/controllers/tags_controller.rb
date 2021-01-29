class TagsController < ApplicationController
  def index
    # @tags = ActsAsTaggableOn::Tag.all
    @tags = ActsAsTaggableOn::Tag.for_context(:tags)
    @base_techs = ActsAsTaggableOn::Tag.for_context(:base_techs)
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @technologies = Technology.tagged_with(@tag.name).published
  end
end