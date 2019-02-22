#!/usr/bin/env ruby
# csv pagination experiment
# by Oran C
# github.com/wisehackermonkey
# 20190221

require 'csv'
require 'tempfile'
# begin
header = nil
Csv_data = []

run_small_file = false
# large_csv_name = "real_data-100k.csv"
large_csv_name = "real_data-1000k.csv"
file_name = run_small_file ? "real_customer_data.csv" : large_csv_name
csv_file = File.join(Dir.pwd, file_name)
puts "CSV FileFile Opened: #{csv_file}"


# read 50 lines then stop delete those 50 lines
#   continue
def fake_api_call(json)
  # puts json.join("  ")
  json.join("  ")
end

line_number = 0
temp_line = []
interval = 1000
CSV.foreach(csv_file) do |line|
  line_number += 1
  next if line_number == 1
  if line_number % 10000 == 0
    puts line_number
  end
  if line_number % interval == 0
    # puts "ran for 50 records: line num #{line_number}, temp size #{temp_line.length},"
    fake_api_call(temp_line)
    temp_line = []
  end
  # break if line_number == 200
  # puts line_number.to_s + " | "
  temp_line << line
end
# puts temp_line
