class AddTranslatedLanguageToFactSheets < ActiveRecord::Migration
  def change
    add_column :fact_sheets, :translated_language, :string
  end
end
