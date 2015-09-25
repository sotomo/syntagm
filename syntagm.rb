require 'optparse'
require 'net/http'
require 'json'

Syntagm = Struct.new(:text, :type)
class Syntagm
  def to_json(*a)
    {:text => self.text.to_s.strip, :type => self.type}.to_json(*a)
  end
end


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

syntagms = []

phrase = ""
hashTags.each { |a| 
  sentence.slice! a
  if(phrase.length>@maxchars.to_i)
    syntagm = Syntagm.new(phrase, "H")
    syntagms << syntagm
    phrase=""
  end
  phrase << a << " "
}
syntagm = Syntagm.new(phrase, "U")
syntagms << syntagm


phrase = ""
urls.each { |u| 
  sentence.slice! u
  if(phrase.length>@maxchars.to_i)
    syntagm = Syntagm.new(phrase, "U")
    syntagms << syntagm
    phrase=""
  end
  phrase << u << " "
}
syntagm = Syntagm.new(phrase, "U")
syntagms << syntagm

phrase = ""
sentence.split(' ').each { |w| 
  if(phrase.length>@maxchars.to_i)
    syntagm = Syntagm.new(phrase, "S")
    syntagms << syntagm
    phrase=""
  end
  phrase << w << " "
}
syntagms << syntagm

p syntagms.to_json