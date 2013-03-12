class Sender

  def initialize(said)
    @said = said
  end

  def mood
    if @feel_acknowledged
      "content"
    end
  end

  def describe_day_to(another_person)
    if satisified_with_interpretation?(another_person.interpret(@said))
      @feel_acknowledged = true
    end
  end

  def satisified_with_interpretation?(interpretation)
    shared_words = interpretation.split(' ') & @said.split(' ')
    true if shared_words.size >= 2
  end

end

class Recipient
  def interpret(sentance)
    if sentance == "I had a good day"
      "I'm glad you had a good day" 
    end
  end
end

describe Sender do
  it "is content the listener attempted to understand" do
    significant_other = Sender.new "I had a good day"
    me = Recipient.new
    significant_other.describe_day_to(me)
    significant_other.mood.should >= "content"
  end
end
