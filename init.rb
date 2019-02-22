#!/usr/bin/env ruby
# csv pagination experiment
# by Oran C
# github.com/wisehackermonkey
# 20190221

require 'csv'
require 'tempfile' # create a auto deleting file


# enter your csv file name here
file_name = "real_data-1000k.csv"
csv_file = File.join(Dir.pwd, file_name)
puts "CSV FileFile Opened: #{csv_file}"


# Simulate vendor api call by saving a temporary file
# to disk with the 'buffer' to disk, when f.close is call
# the file is deleted
def fake_api_call(buffer)
  f = Tempfile.new('tempfile')
  f.puts buffer.join("  ")
  # puts f.path
  f.close
end

# In a memory efficient way process a large
# Csv file, and call a fake_api_call() every 1000 rows
def read_large_csv_file(file_path)
  line_number = 0
  buffer_array = []
  interval = 1000
  # CSV.foreach reads on line at a time, and
  # only keeps that line in memory until end of block
  CSV.foreach(file_path) do |line|
    line_number += 1
    # skip the header of the csv file EX: OrderNumber, OrderDate, OrderType, BillCustomerNumber
    next if line_number == 1

    # give indication of processing progress
    puts "Rows Processed: #{line_number}" if line_number % 10000 == 0

    # Every 'interval' number of rows excite the block
    if line_number % interval == 0

      #here would be the api call
      fake_api_call(buffer_array)

      # clear the buffer so ram doesnt get out of control
      buffer_array = []
    end
    # create a running buffer from the rows of the csv file
    buffer_array << line
  end
  puts "Final buffer_array Size: #{buffer_array.size}"
end


# main
read_large_csv_file(csv_file)