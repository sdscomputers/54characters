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
        client = Client.create(first_name: row[1], middle_name: row[2],
                               last_name: row[3], name_quality: row[4],
                               birthday: row[7], birthday_quality: row[8],
                               ss_number: row[5], veteran: row[17],
                               gender: get_gender(row[15]))
        create_ethnicity_records(row, client.id)
        create_military_records(row, client.id) if client.veteran
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

    def create_military_records(row, client_id)
      ClientMilitaryConflict.create(client_id: client_id, military_conflict_id: 1) if row[19] == '1'
      ClientMilitaryConflict.create(client_id: client_id, military_conflict_id: 2) if row[20] == '1'
      ClientMilitaryConflict.create(client_id: client_id, military_conflict_id: 3) if row[21] == '1'
      ClientMilitaryConflict.create(client_id: client_id, military_conflict_id: 4) if row[22] == '1'
      ClientMilitaryConflict.create(client_id: client_id, military_conflict_id: 5) if row[23] == '1'
      ClientMilitaryConflict.create(client_id: client_id, military_conflict_id: 6) if row[24] == '1'
    end

    def get_gender(gender)
      case gender
      when '1'
        'M'
      when '0'
        'F'
      when '3'
        'T'
      else
        nil
      end
    end
  end
end
