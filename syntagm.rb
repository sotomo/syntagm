require 'optparse'
require 'net/http'

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

sentence = @sentence

hashTags = @sentence.scan(/\@\w+/)
urls = URI.extract(@sentence)

extractions = []

hashTags.each { |a| 
  extractions.push(a) 
  sentence.slice! a
}

urls.each { |u| 
  extractions.push(u) 
  sentence.slice! u
}

syntagm = ""
sentence.split(' ').each { |w| 
  if(syntagm.length>@maxchars.to_i)
    extractions.push(syntagm)
    syntagm=""
  end
  syntagm << w
}


p extractions




