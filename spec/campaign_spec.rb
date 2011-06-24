require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Zferral::Campaign do
  use_vcr_cassette "campaigns"

  subject { Zferral.new(:subdomain => subdomain, :api_token => api_token).campaign }

  describe "#list" do
    it "returns an array of your campaigns" do
      subject.list.should be_an_array_of_campaigns
    end
    
    it "is aliased by #all" do
      subject.all.should == subject.list
    end
    
    it "is aliased by #find(:all)" do
      subject.find(:all).should == subject.list
    end
  end
  
  describe "#fetch" do
    context "given a valid ID" do
      it "fetches and returns the campaign" do
        subject.fetch(1).should be_a_campaign
      end
    end
    context "given an invalid ID" do
      it "raises a ResourceNotFound exception" do
        lambda { subject.fetch(9999999) }.should raise_error(Zferral::ResourceNotFound, "campaign with id=9999999 was not found")
      end
    end
    
    it "is aliased by #find(id)" do
      subject.find(1).should == subject.fetch(1)
    end
  end
end
