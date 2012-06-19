require './customer.rb'

namespace :task do

  desc "Starts task"
  task :start, :task do |t, args|
    customer= Customer.find_or_create_by_name("Handy Metrics")
    task = Task.create(args.task)
    task.start
    customer.tasks << task
  end

  desc "Ends task"
  task :stop do
    customer= Customer.find_or_create_by_name("Handy Metrics")
    task = customer.tasks.last
    task.end
    task.save
  end

  desc "creates report files"
  task :report do
    appender = Appender.new
    appender.csv
    appender.html
  end

end

namespace :db do

  desc "Creates database"
  task :create do
    require './db/schema.rb'
  end

end
