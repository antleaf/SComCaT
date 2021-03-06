class AboutController < ApplicationController

  def index
  end

  def graph
    nodes_array = [{"name": 'node_1'},{"name": 'node_2'},{"name": 'node_3'}]
    # links_array = [{"source": 0, "target": 1, "value": 'depends_on'},{"source": 1, "target": 2, "value": 'depends_on'}]
    nodes_array = []
    Technology.all.each do |tech|
      nodes_array << {"name": tech.name,"slug": tech.slug}
    end
    links_array = []
    Dependency.all.each do |dep|
      links_array << {"source": nodes_array.find_index({"name": dep.technology.name,"slug": dep.technology.slug}), "target": nodes_array.find_index({"name": dep.dependee.name,"slug": dep.dependee.slug}),"value": 1}
    end
    @graph = {"nodes" => nodes_array,"links" => links_array}.to_json.html_safe
  end
end
