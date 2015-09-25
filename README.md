    _______ __   __ __   _ _______ _______  ______ _______
    |______   \_/   | \  |    |    |_____| |  ____ |  |  |
    ______|    |    |  \_|    |    |     | |_____| |  |  |
                                                       


Divides sentences and posts into smaller phrases.
Nothing special yet.  No linquistic recognition.  
Separates hashtags, urls, and plain text.
Just brutushly divides things up.

The Json formatted result indicates the type which can be a hashtag (H), a URL (U), or the remaining text (T).

## Usage

ruby syntagm.rb -s "place your sentence here" -m [maximum characters]

## Example

Command:

ruby syntagm.rb -s "@ruby @python c# are all equally great.  Yet at this point it might be important to mention that all I want to do is divide this long sentence into pieces.  I'm not interested in anything making sense in the divided segments. are incredibly great. http://www.google.com this or http://www.git.com is a test for syntagm" -m 40"

Result:

[{\"text\":\"@ruby @python\",\"type\":\"H\"},{\"text\":\"http://www.google.com http://www.git.com\",\"type\":\"U\"},{\"text\":\"c# are all equally great. Yet at this point\",\"type\":\"T\"},{\"text\":\"it might be important to mention that all\",\"type\":\"T\"},{\"text\":\"I want to do is divide this long sentence\",\"type\":\"T\"},{\"text\":\"into pieces. I'm not interested in anything\",\"type\":\"T\"},{\"text\":\"making sense in the divided segments. are\",\"type\":\"T\"},{\"text\":\"incredibly great. this or is a test for syntagm\",\"type\":\"T\"}]