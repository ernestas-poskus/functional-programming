# What's a Symbol?
# You can think of a Ruby symbol as a sort of name. It's important to remember that symbols aren't strings:

# "string" == :string # false
# Above and beyond the different syntax, there's a key behavior of symbols that makes them different from strings: 
# while there can be multiple different strings that all have the same value, there's only one copy of any particular symbol at a given time.

puts "string".object_id
puts "string".object_id

puts :symbol.object_id
puts :symbol.object_id

menagerie = { :foxes => 2,
  :giraffe => 1,
  :weezards => 17,
  :elves => 1,
  :canaries => 4,
  :ham => 1
}


