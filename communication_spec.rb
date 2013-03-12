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
    if another_person.listened_to_day?
      @feel_acknowledged = true
    end
  end

end

class Recipient
end

describe Sender do
  it "is content the listener listened" do
    significant_other = Sender.new(message: "I had a good day")
    me = double(Recipient)
    me.stub(:listened_to_day?) { true }

    significant_other.describe_day_to(me)
    significant_other.mood.should >= "content"
  end

  it "is content the listener attempted to understand" do
  end
end
