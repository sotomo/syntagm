require 'optparse'

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Syntagm"

  opts.on("-s", "--sentence SENTENCE", "sentence or post") do |s|
    @sentence =  s
  end
  opts.on("-m", "--maxchars MAXCHARS", "maximum characters") do |m|
    @maxchars =  m
  end

end

optparse.parse!

p "the sentence is: #{@sentence}" 
p "max chars: #{@maxchars}" 