require 'spec_helper'

describe(Train) do
  describe("#all") do
    it("starts off with no trains") do
      expect(Train.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("returns its name") do
      train = Train.new({:name => "Red Line", :direction => "West"})
      expect(train.name()).to(eq("Red Line"))
    end
  end

  describe("#id") do
    it("sets its id when saved") do
      train = Train.new({:name => "Red Line", :direction => "West"})
      train.save()
      expect(train.id()).to(be_an_instance_of(Integer))
    end
  end

  describe("#save") do
    it("saves train to the database") do
      train = Train.new({:name => "Red Line", :direction => "West"})
      train.save()
      expect(Train.all()).to(eq([train]))
    end
  end

  describe("#update") do
    it("updates train to the database") do
      train = Train.new({:name => "Red Line", :direction => "West"})
      train.save()
      train.update({:name => "Blue Line", :direction => "East"})
      expect(train.name()).to(eq("Blue Line"))
      expect(train.direction()).to(eq("East"))
    end
  end

  describe('#delete')do
    it("deletes a train from the database")do
    train = Train.new({:name => "Red Line", :direction => "West"})
    train.save()
    train.delete
    expect(Train.all).to(eq([]))
    end
  end

  describe(".all_by_direction") do
    it("sorts based off of direction") do
      train1 = Train.new({:name => "Red Line", :direction => "West"})
      train1.save()
      train2 = Train.new({:name => "Green Line", :direction => "East"})
      train2.save()
      expect(Train.all_by_direction("West")).to(eq([train1]))
    end
  end

  describe("#==") do
    it("is the same if the id and name match") do
      train1 = Train.new({:name => "Red Line", :direction => "West"})
      train2 = Train.new({:name => "Red Line", :direction => "West"})
      expect(train1).to(eq(train2))
    end
  end

  describe(".find_by_id") do
    it("will find the train with a given id") do
      train = Train.new({:name => "Red Line", :direction => "West"})
      train.save
      expect(Train.find_by_id(train.id)).to(eq(train))
    end
  end

end
