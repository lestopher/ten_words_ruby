# Takes in words, spits out ten most commonly used words
class TenWords
  BLACKLIST = %w{a an the of to and for our in has}
  attr_reader :data, :topTenWords, :wordCount

  def initialize(arg={})
    @data        = sanitize(arg[:data]) || [""]
    @topTenWords = []
    @wordCount   = {} 

    @data = @data.split(" ") if @data.class == String
    @data.reject!{ |d| BLACKLIST.include? d }
  end

  def get_top_ten_words(showCount=false)
    return @topTenWords if @topTenWords.length > 0
    @topTenWords = count_words.slice(0, 10).map{ |w| showCount ? "#{w[0]} - #{w[1]}" : w[0] }
  end

  private

  def sanitize(data)
    data.downcase.gsub(/[\,\:\;\.\&\n]/, '')
  end

  def count_words
    unless @wordCount.length > 0
      @data.each do |d|
        if @wordCount.has_key? d
          @wordCount[d] += 1
        else
          @wordCount[d] = 1
        end
      end
    end

    @wordCount.sort_by{ |k, v| v }.reverse
  end
end
