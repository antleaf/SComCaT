class AddPropertiesToTechnologies < ActiveRecord::Migration[6.0]
  def change
    add_column :technologies, :roadmap, :string
    add_column :technologies, :codebase, :string
    add_column :technologies, :hosting, :string
    add_column :technologies, :pricing, :string
    add_column :technologies, :licensing, :string
    add_reference :technologies, :business_form, foreign_key: true
    add_reference :technologies, :status, foreign_key: true
    # change_column_null(:technologies, :business_form, false)
    # # change_column_null(:technologies, :status, false)
  end
end
