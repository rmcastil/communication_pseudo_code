class Person

  def mood
    if @feel_acknowledged
      "happy"
    end
  end

  def describe_day_to(another_person)
    #if another_person.interpretation_of_day == interpretation_of_day
    if another_person.listened_to_day
      @feel_acknowledged = true
    end
  end

  def interpretation_of_day
  end
end

describe Person do
  it "has a pleasent conversation" do
    significant_other = Person.new(description_of_day: "a good day")
    me = Person.new

    significant_other.describe_day_to(me)
    significant_other.mood.should == "happy"
  end
end
