class Appender
  require 'csv'

  def csv 
    file = CSV.open('static/timeTracker.csv','w')
    file << ['Date', 'Customer','Task Name', 'Start Time', 'End Time', 'Total']
    Customer.all.each do |c|
      c.tasks.each do |t|
        file << [t.created_at.to_date, c.name, t.name, t.start_time.strftime("%H:%M"), t.end_time.strftime("%H:%M"), t.total]
      end
    end
    file.close
  end

  def html
    htmlFile = File.new("static/invoice.html", "w+")
    htmlFile.puts "<html><head></head>"
    htmlFile.puts "<head><LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\"></head>"
    htmlFile.puts "<body>"
    htmlFile.puts "<table>"
    htmlFile.puts "<tr>"
    htmlFile.puts "<th>Date</th>"
    htmlFile.puts "<th>Customer</th>"
    htmlFile.puts "<th>Task</th>"
    htmlFile.puts "<th>Start Time</th>"
    htmlFile.puts "<th>End Time</th>"
    htmlFile.puts "<th>Total Time(hours)</th>"
    htmlFile.puts "</tr>"

    Customer.all.each do |c|
      c.tasks.each do |t|
        htmlFile.puts "<tr>"
        htmlFile.puts "<td>#{t.created_at.to_date}</td>"
        htmlFile.puts "<td>#{c.name}</td>"
        htmlFile.puts "<td>#{t.name}</td>"
        htmlFile.puts "<td>#{t.start_time.strftime("%H:%M")}</td>"
        htmlFile.puts "<td>#{t.end_time.strftime("%H:%M")}</td>"
        htmlFile.puts "<td>#{t.total}</td>"
        htmlFile.puts "</tr>"
      end
    end
    htmlFile.puts "</table>"
    htmlFile.puts "</body>"
    htmlFile.puts "</html>"
    htmlFile.close
  end

end
