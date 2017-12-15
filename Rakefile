require 'data_mapper'
require './app/app.rb'

namespace :dm do
  desc 'upgrade (no data loss)'
  task :upgrade do
    DataMapper.auto_upgrade!
    puts 'Database upgrade complete'
  end

  desc 'migrate (data will be lost)'
  task :migrate do
    DataMapper.auto_migrate!
    puts 'Database migration complete'
  end
end
