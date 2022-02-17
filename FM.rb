
  file_path = './data/input.txt'
  if File.exist?(file_path)
    f = File.new(file_path, 'r:UTF-8')
    line =  f.readlines.map(&:chomp)
    f.close
  end
  new_l = line.map { |v| v.split(', ')  }
  arr = new_l.map { |v| v.map {|value| [value.split[0..-2].join(' '), value.split[-1].to_i]} }

  arr.each_index do  |i|
    if arr[i][0][1] == arr[i][1][1]
      arr[i][0][1] = 1
      arr[i][1][1] = 1
    elsif arr[i][0][1] < arr[i][1][1]
      arr[i][0][1] = 0
      arr[i][1][1] = 3
    else arr[i][0][1] > arr[i][1][1]
      arr[i][0][1] = 3
      arr[i][1][1] = 0
    end
  end

  arr.flatten!(1)
   arr_hash = {}
  arr.each do |el|
    sum = 0
    arr.each { |val| sum += val[1] if val[0] == el[0] }
    arr_hash[el[0].to_sym] = sum
  end

result = arr_hash.to_a
result.each_index { |i| result[i][0], result[i][1] = -result[i][1], result[i][0].to_s}
result.sort!
result.each_index {|i| puts"#{i+1}. #{result[i][1]}, #{-result[i][0]} #{result[i][0] == -1 ? 'pt' : 'pts'}" }
