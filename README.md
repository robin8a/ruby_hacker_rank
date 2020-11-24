# ruby_hacker_rank


# Ruby - Strings - Encoding
- [Encoding](https://ruby-doc.org/core-2.2.2/Encoding.html#class-Encoding-label-Changing+an+encoding)

```rb
str = "With ♥!"
print("My String's encoding: ", str.encoding.name) 
print("\nMy String's size: ", str.size)
print("\nMy String's bytesize: ", str.bytesize)
```


# Ruby - Strings - Indexing

```rb
str = "Hello World!"
str[str.size-1]
"!"
str[-1] # first character from the end of the string
"!"
str[-2] # second last character
"d"
str[0] # first character
"H"


str[0,4] # first four characters
"Hell"
str[6,3] # 3 characters starting from index 6 ( 0-indexing )
"Wor"
str[-1, 1] # 1 character starting from the END of string
"!"

str = "Hello"
str[str.size, 0] = " World!" # append by assigning at the end of the string
str
"Hello World!"
str[5, 0] = "," # insert a comma after the 5th position
str[5, 6] = ""  # delete 6 characters starting from index 5. 
"Hello!"
str[5,1] = " World" # replace the string starting from index 5 and of length 1 with the given string. 

```

# Ruby - Strings - Iteration

With Ruby 1.9, each was removed from the String class and is no longer an Enumerable. Instead, we have more explicit choices based on what we need to iterate - bytes, chars, lines or codepoints.

each_byte iterates sequentially through the individual bytes that comprise a string;
each_char iterates the characters and is more efficient than [] operator or character indexing;
each_codepoint iterates over the ordinal values of characters in the string;
each_line iterates the lines.

```rb
def count_multibyte_char(str)
    count = 0
    
    str.each_char do |char|
        count += 1 if char.bytesize > 1
    end
    
    return count
end
```

# Ruby - Strings - Methods I

```rb
# String.chomp(separator=$/): Returns a new string with the given separator removed from the end of the string (if present). If $/ has not been changed from the default Ruby record separator, then chomp also removes carriage return characters (that is, it will remove \n, \r, and \r\n).
> "Hello World!  \r\n".chomp
"Hello World!  "
> "Hello World!".chomp("orld!")
"Hello W"
> "hello \n there".chomp
"hello \n there"
# String.strip - Returns a new string with the leading and trailing whitespace removed.
> "    hello    ".strip
"hello"
> "\tgoodbye\r\n".strip
"goodbye"
#String.chop - Returns a new string with the last character removed. Note that carriage returns (\n, \r\n) are treated as single character and, in the case they are not present, a character from the string will be removed.
> "string\n".chop
"string"
> "string".chop
"strin"
```

```rb

def process_text p_array    
    p_array.map { |c| c.chomp.strip }.join(' ')
end

```

# Ruby - Strings - Methods II

```rb
# String.include?(string) - Returns true if str contains the given string or character. Very simple!
    > "hello".include? "lo"   #=> true  
    > "hello".include? "ol"   #=> false  
# String.gsub(pattern, <hash|replacement>) - Returns a new string with all the occurrences of the pattern substituted for the second argument: . The pattern is typically a Regexp, but a string can also be used.
    "hello".gsub(/[aeiou]/, '*')                  #=> "h*ll*"
    "hello".gsub(/([aeiou])/, '')             #=> "hll"
```

```rb
def strike(word)
    "<strike>#{word}</strike>"
end

def mask_article(string, words)
  words.each do |word|
    string.gsub!(word, strike(word))
  end

  string
    # words.map { |word| word.gsub(word, strike(word))}
end
```

# Ruby Control Structures - Until

```rb
while not <condition>
    <code>
end


until <condition>
    <code>
end
```

# When case obj.class

```rb
def identify_class(obj)
    # write your case control structure here
    case obj
        when Hacker, Submission, TestCase, Contest
             puts "It's a #{obj.class}!"
        else
            puts "It's an unknown model"
    end 
end
```


# Ruby Hash - Addition, Deletion, Selection

```rb
# Consider the following Hash object:

h = Hash.new
h.default = 0
# A new key-value pair can be added using or the store method

h[key] = value

# or

h.store(key, value)
# An existing key can be deleted using the delete method

h.delete(key)

# For destructive selection and deletion, we can use keep_if and delete_if as seen in Array-Selection

> h = {1 => 1, 2 => 4, 3 => 9, 4 => 16, 5 => 25}
 => {1 => 1, 2 => 4, 3 => 9, 4 => 16, 5 => 25}
> h.keep_if {|key, value| key % 2 == 0} # or h.delete_if {|key, value| key % 2 != 0}
 => {2 => 4, 4 => 16}
```

## Challenge
```rb

hackerrank.keep_if {|key, value| key.is_a? Integer}

hackerrank.delete_if {|key, value| key == key}

hackerrank.store(543121, 100)

```


# Ruby Control Structures - Infinite Loop

```rb
# An infinite loop in Ruby is of the form

loop do
end
# Use an infinite loop and call the method coder.practice within it and break if coder.oh_one? is true.

# break if conditions in Ruby are of the form

if <condition>
    break
end
# or a one-liner

break if <condition> 
```

## Challenge
```rb
loop do
    break if coder.oh_one?
    coder.practice
end

loop { coder.oh_one? ? break : coder.practice}

```

# Ruby Hash - Each

```rb
# Using each, each element can be iterated as

user.each do |key, value|
    # some code on individual key, value
end
# or

user.each do |arr|
    # here arr[0] is the key and arr[1] is the value
end
# Your task is to use each and iterate through the collection and print the key-value pair in separate lines.

# Hint

puts key
puts value
```

## Challenge
```rb
def iter_hash(hash)
    # your code here
    hash.each do |key, value|
        # here arr[0] is the key and arr[1] is the value
        puts key
        puts value
    end
end
```


# Ruby - Enumerable - Introduction


## Challenge
```rb
def iterate_colors(colors)
  # Your code here
    colors.to_a
end
```

# Ruby - Enumerable - each_with_index

```rb
# For example,

> colors = ['red', 'green', 'blue']
> colors.each_with_index { |item, index| p "#{index}:#{item}" }
"0:red"
"1:green"
"2:blue"
# As you can note, the counting of items starts from 0.

# In this challenge, your task is to complete the skip_animals method that takes an animals array and a skip integer and returns an array of all elements except first skip number of items as shown in the example below.

# For example,

> skip_animals(['leopard', 'bear', 'fox', 'wolf'], 2)
=> ["2:fox", "3:wolf"]

```


## Challenge

```rb
colors.each_with_index { |item, index| p "#{index}:#{item}" }


def skip_animals(animals, skip)
  # Your code here
end


def skip_animals(animals, skip)
    arr = []
    animals.each_with_index do |item, index|
        if(index >= skip)
            arr.push("#{index}:#{item}")
        end
    end
    return arr
end

animals.each_with_index { |item, index| p "#{index}:#{item}" }

hackerrank.keep_if {|key, value| key.is_a? Integer}

```