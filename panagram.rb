# Panagram problem statement:
# A pangram is a phrase which contains every letter at least once,
# such as "the quick brown fox jumps over the lazy dog".
# Write a function which determines if a given string is a pangram.

# Solution 1
# Space complexity: O(n) since we store the entire string
# Time complexity: O(n) since we iterate through the string once
# How I came up with this solution: remove characters from a set was the
# most intuitive approach I could think of
require 'set'

def panagram?(string)
  alphabet_set = "abcdefghijklmnopqrstuvwxyz".split("").to_set
  string.split("").each do |char|
    alphabet_set.delete?(char.downcase)
  end
  alphabet_set.length === 0
end

# Solution 2
# Space complexity: O(n) since we store the entire string
# Time complexity: O(n) since we iterate through the string once
def panagram?(string)
  alphabet_hash = Hash.new()
  "abcdefghijklmnopqrstuvwxyz".split("").each do |alphabet|
    alphabet_hash[alphabet] = nil
  end
  string.split("").each do |char|
    alphabet_hash.delete(char.downcase)
  end
  alphabet_hash.length === 0
end
