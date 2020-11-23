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
> "Hello World!  \r\n".chomp
"Hello World!  "
> "Hello World!".chomp("orld!")
"Hello W"
> "hello \n there".chomp
"hello \n there"
String.strip - Returns a new string with the leading and trailing whitespace removed.
> "    hello    ".strip
"hello"
> "\tgoodbye\r\n".strip
"goodbye"
String.chop - Returns a new string with the last character removed. Note that carriage returns (\n, \r\n) are treated as single character and, in the case they are not present, a character from the string will be removed.
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