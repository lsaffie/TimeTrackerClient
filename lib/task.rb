class Task < ActiveRecord::Base

  belongs_to :customer

  attr_accessible :start_time
  attr_accessible :end_time
  attr_accessible :total
  attr_accessible :name

  def initialize(task_name="")
    super
    self.name = task_name
  end

  def start
    self.start_time = Time.now
  end

  def end
    self.end_time= Time.now
    self.total = ((self.end_time - self.start_time) / 3600).round(2)
  end

end
