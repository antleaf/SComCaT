class HomeController < ApplicationController

  class TechnologySearch < FortyFacets::FacetSearch
    model 'Technology' # which model to search for
    scope :published, name: 'published'
    text :name   # filter by a generic string entered by the user
    text :description   # filter by a generic string entered by the user
    # range :price, name: 'Price' # filter by ranges for decimal fields
    facet :governance, name: 'Governance', order: :name
    facet :adoption_level, name: 'Adoption Level', order: :name
    facet :readiness_level, name: 'Readiness Level', order: :name
    facet :functions, name: 'Function', order: :name
    facet :categories, name: 'Category', order: :name
    facet :collections, name: 'Collection', order: :name
    facet :status, name: 'Status', order: :name
    facet :business_form, name: 'Business Form', order: :name

    # facet [:studio, :country], name: 'Country' # generate a filter several belongs_to 'hops' away

    # orders 'Title' => :title,
    #        'price, cheap first' => "price asc",
    #        'price, expensive first' => {price: :desc, title: :desc}
    # custom :for_manual_handling
    #
    # def root_scope
    #   Technology.published
    # end

  end

  def index
    @search = TechnologySearch.new(params) # this initializes your search object from the request params
    @technologies = @search.result.paginate(page: params[:page], per_page: 20) # optionally paginate through your results
    @technologies = @technologies.published
  end

end
