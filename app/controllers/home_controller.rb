class HomeController < ApplicationController

  class TechnologySearch < FortyFacets::FacetSearch
    model 'Technology' # which model to search for
    custom :name   # filter by a generic string entered by the user
    facet :governance, name: 'Governance'#, order: :name
    facet :adoption_level, name: 'Adoption Level'#, order: :name
    facet :readiness_level, name: 'Readiness Level'#, order: :name
    facet :functions, name: 'Function'#, order: :name
    facet :categories, name: 'Category'#, order: :name
    facet :collections, name: 'Collection'#, order: :name
    facet :status, name: 'Status'#, order: :name
    facet :business_form, name: 'Business Form'#, order: :name
  end

  def index
    @search = TechnologySearch.new(params,Technology.published) # this initializes your search object from the request params
    if @search.filter(:name).value.present?
      @search = TechnologySearch.new(params,Technology.published.where("lower(technologies.name) LIKE ?", "%#{@search.filter(:name).value.downcase}%"))
    end
    @technologies_no_pagination = @search.result.order(:slug)
    @technologies = @technologies_no_pagination.paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.json { send_data Technology.dump_to_json(@technologies_no_pagination), filename: "technologies-#{Time.now.strftime('%Y-%m-%d_%H-%M')}.json" }
      format.csv { send_data Technology.dump_to_csv(@technologies_no_pagination), filename: "technologies-#{Time.now.strftime('%Y-%m-%d_%H-%M')}.csv" }
    end
  end

end
