require 'roo'

namespace :import do
  desc "Import data from spreadsheet"
  task data: :environment do
    puts 'Importing Data'

    data = Roo::Spreadsheet.open('../db/exercises.xlsx')
    headers = data.row(1)
  end
end
