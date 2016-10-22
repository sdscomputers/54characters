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
                               gender: get_gender(row[15]),
                               service_branch: get_military_branch(row[28]),
                               service_start_date: date_for_year(row[18]),
                               service_end_date: date_for_year(row[19]))
        create_ethnicity_records(row, client.id)
        create_military_records(row, client.id) if client.veteran
      end

      Client.where(service_branch: nil)
            .update_all(service_start_date: nil, service_end_date: nil)
    end

    private

    def date_for_year(year)
      year = year.try(:to_i)
      return unless year
      Date.new(year, 1, 1)
    end

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

    def get_military_branch(branch)
      case branch
      when '1'
        'A'
      when '2'
        'N'
      when '3'
        'F'
      when '4'
        'M'
      when '5'
        'C'
      else
        nil
      end
    end
  end
end
