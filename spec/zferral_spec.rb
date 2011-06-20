require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Zferral" do
  subject { Zferral.new(:subdomain => subdomain, :api_token => api_token) }

  describe ".new" do
    it "creates a new instance of Zferral::Client" do
      Zferral.new.should be_a(Zferral::Client)
    end
  end
  
  describe "#campaign" do
    specify { subject.campaign.should == Zferral::Campaign }
    it 'should set client to reference self' do
      subject.campaign.client.should == subject
    end
  end

  describe "#event" do
    specify { subject.event.should == Zferral::Event }
    it 'should set client to reference self' do
      subject.event.client.should == subject
    end
  end
end

