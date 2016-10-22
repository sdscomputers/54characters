require "#{Rails.root}/lib/hud_importer/lib/hud_importer/client_importer"

desc 'Run Importer'
task :run_importer => :environment do
  file_name = "#{Rails.root}/.csv_data/clients.csv"
  HudImporter::ClientImporter.new(file_name).import
end
