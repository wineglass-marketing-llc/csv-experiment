# slow version of the csv read program
# THIS CODE WILL CAUSE LARGE RAM SPIKE AND WILL NOT FINISH
# by Oran C
# oranbusiness@gmail.com
# github.com/wisehackermonkey
# 20190222
#
require 'csv'

file_name = "real_data-100k.csv"
csv_file = File.join(Dir.pwd, file_name)
puts "CSV FileFile Opened: #{csv_file}"


# First attempt,
# this causes major ram spike and will not complete
csv_arr = CSV.read(csv_file)
csv_arr.each {|row| puts row.join(" ")}
