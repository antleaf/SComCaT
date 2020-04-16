class AdminController < ApplicationController
  require 'zip'
  require 'csv'

  def index
    authorize self

    respond_to do |format|
      format.html
      format.zip do
        begin
          data_model_names = ['Governance','AdoptionLevel','Category','Function','ReadinessLevel','Relationship','Technology']
          compressed_filestream = Zip::OutputStream.write_buffer do |zos|
            data_model_names.each do |data_model_name|
              zos.put_next_entry "#{data_model_name}.csv"
              zos.print eval(data_model_name).to_csv
            end
            sql = "SELECT * from categories_technologies"
            result = ActiveRecord::Base.connection.execute(sql)
            zos.put_next_entry "TechnologyCategory.csv"
            csv_file_data = CSV.generate(headers: true) do |csv|
              csv << ['technology_id','category_id']
              result.each do |join|
                technology_slug = Technology.find(join['technology_id'].to_i).slug
                category_slug = Category.find(join['category_id'].to_i).slug
                csv << [technology_slug,category_slug]
              end
            end
            zos.print csv_file_data

            sql = "SELECT * from functions_technologies"
            result = ActiveRecord::Base.connection.execute(sql)
            zos.put_next_entry "TechnologyFunction.csv"
            csv_file_data = CSV.generate(headers: true) do |csv|
              csv << ['technology_id','function_id']
              result.each do |join|
                technology_slug = Technology.find(join['technology_id'].to_i).slug
                function_slug = Function.find(join['function_id'].to_i).slug
                csv << [technology_slug,function_slug]
              end
            end
            zos.print csv_file_data

          end
          compressed_filestream.rewind
          send_data compressed_filestream.read, filename: "scomcat_data_dump_csv_#{Time.now().strftime('%Y-%m-%d_%H:%M')}.zip"
        rescue StandardError => e
          redirect_to admin_url, error: e.message
        end
      end
    end
  end
end
