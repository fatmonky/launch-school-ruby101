name = 'johnson'

['kim', 'joe', 'sam'].each do |fname|
  # uh-oh, we cannot access the outer scoped "name"!
  puts "#{fname} #{name}"
end
