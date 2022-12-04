def file_to_input(file)
  input = File.readlines(file, chomp:true).map(&:to_i)
end

input = []
file = "input.txt"

file_to_input(file).each do |snack|
  if snack > 0
    input.append(snack)
  else
    input.append("end")
  end
end

def each_elfs_total(array)
  totals = []
  total_for_elf = 0
  index = 0

  array.each do |element|
    if element != "end"
      total_for_elf += element
    else 
      totals[index] = total_for_elf
      index += 1
      total_for_elf = 0
    end
  end
  totals.sort!.reverse!
end

result = each_elfs_total(input)
puts "elf carrying the most is #{result[0]}"
puts "top three elves are carrying #{result[0] + result[1] + result[2]}"