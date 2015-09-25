require 'optparse'
require 'net/http'


class Syntagm

  def initialize(text, type)
    @text = text
    @type = type
  end
  
  def wrapup
      @text=@text.to_s.strip
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
    syntagms.push(syntagm)
    phrase=""
  end
  phrase << a << " "
}
syntagm = Syntagm.new(phrase, "U")
syntagms.push(syntagm)


phrase = ""
urls.each { |u| 
  sentence.slice! u
  if(phrase.length>@maxchars.to_i)
    syntagm = Syntagm.new(phrase, "U")
    syntagms.push(syntagm)
    phrase=""
  end
  phrase << u << " "
}
syntagm = Syntagm.new(phrase, "U")
syntagms.push(syntagm)

phrase = ""
sentence.split(' ').each { |w| 
  if(phrase.length>@maxchars.to_i)
    syntagm = Syntagm.new(phrase, "S")
    syntagms.push(syntagm)
    phrase=""
  end
  phrase << w << " "
}
syntagms.push(syntagm)

syntagms.each { |s|
    s.wrapup
}

p syntagms




