require './db/ar.rb'
require './lib/task.rb'
require './lib/appender.rb'

class Customer < ActiveRecord::Base

  has_many :tasks

  attr_accessible :name
  attr_accessor :task
  attr_reader :file

  def initialize
    super
    @file = Appender.new
    @task = Task.new
  end

  def customer=(customer_name)
    self.customer_name = customer_name
  end

end
