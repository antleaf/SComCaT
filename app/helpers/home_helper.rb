module HomeHelper
  def url_for_downloadable_data_from_facets(search_params,new_format)
    new_params = {:format => new_format,:search => search_params}
    url_for :params => params.permit(:action,:controller,:format,:search).merge(new_params)
  end
end
