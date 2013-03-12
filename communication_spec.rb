class Sender

  def initialize(messages)
    @messages = messages
  end

  def mood
    if @feel_acknowledged
      "content"
    end
  end

  def describe_day_to(another_person)
    @messages.each do |message|
      if satisified_with_interpretation?(another_person.interpret(message),
                                         message)
        @feel_acknowledged = true
      else
        @feel_acknowledged = false
      end
    end
  end

  def satisified_with_interpretation?(interpretation, message)
    shared_words = interpretation.split(' ') & message.split(' ')
    true if shared_words.size >= 1
  end

end

class Recipient
  def interpret(sentance)
    if sentance == "I had a good day"
      "I'm glad you had a good day" 
    elsif sentance == "Heroku was down"
      "What is Heroku?"
    elsif sentance == "There was ruby drama on twitter"
      "There is drama with ruby? Isn't it a programming language?"
    elsif sentance == "My presentation isn't done yet"
      "I'm sorry your presentation is taking so long"
    end
  end
end

describe Sender do
  it "is in a content mood when understood" do
    significant_other = Sender.new ["I had a good day"]
    me = Recipient.new
    significant_other.describe_day_to(me)
    significant_other.mood.should >= "content"
  end

  it "is in a content mood when all frustrations are understood" do
    complaints = ["Heroku was down",
                  "There was ruby drama on twitter",
                  "My presentation isn't done yet"]
    me = Sender.new complaints 
    significant_other = Recipient.new
    me.describe_day_to(significant_other)
    me.mood.should >= "content"
  end 
end
