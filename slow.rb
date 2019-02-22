# slow version of the csv read program
# by Oran C
# oranbusiness@gmail.com
# github.com/wisehackermonkey
# 20190222
#
require 'csv'
Csv_data = []

run_small_file = false
large_csv_name = "real_data-100k.csv"
file_name = run_small_file ? "real_customer_data.csv" : large_csv_name
csv_file = File.join(Dir.pwd, file_name)
puts "CSV FileFile Opened: #{csv_file}"


# read 50 lines then stop delete those 50 lines
#   continue
def fake_api_call(json)
  puts json.join("  ")
end

# lines = File.foreach(csv_file).first(10)
# or
#
csv_arr = CSV.read(csv_file)
csv_arr.each {|row| puts row.join(" ")}
