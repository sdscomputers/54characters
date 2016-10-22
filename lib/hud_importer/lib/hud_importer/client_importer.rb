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
        client = Client.create(first_name: row[1], middle_name: row[2], last_name: row[3],
                                  name_quality: row[4], birthday: row[7], birthday_quality: row[8],
                                  ss_number: row[5], veteran: row[17])
        create_ethnicity_records(row, client.id)
      end
    end

    private

    def create_ethnicity_records(row, client_id)
      ClientEthnicity.create(client_id: client_id, ethnicity_id: 1) if row[9] == "1"
      ClientEthnicity.create(client_id: client_id, ethnicity_id: 2) if row[10] == "1"
      ClientEthnicity.create(client_id: client_id, ethnicity_id: 3) if row[11] == "1"
      ClientEthnicity.create(client_id: client_id, ethnicity_id: 4) if row[12] == "1"
      ClientEthnicity.create(client_id: client_id, ethnicity_id: 5) if row[13] == "1"
      ClientEthnicity.create(client_id: client_id, ethnicity_id: 6) if row[14] == "1"
    end
  end
end
