require 'csv'

module HudImporter
  class ClientImporter
    attr_accessor :csv_data

    def initialize(filename)
      self.csv_data = CSV.read(filename)
    end

    def import
      csv_data.each_with_index do |row, i|
        next if i == 0
        Client.create(first_name: row[1], middle_name: row[2], last_name: row[3],
                      name_quality: row[4], birthday: row[7], birthday_quality: row[8],
                      ss_number: row[5], veteran: row[17])
      end
    end
  end
end
