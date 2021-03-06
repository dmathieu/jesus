require File.dirname(__FILE__) + '/../spec_helper'
require 'jesus/interface'

describe "God interface" do
  before(:all) do
    @server = Jesus::Interface.new
  end
  
  describe 'no mock' do
    it 'should get the server' do
      @server.server.should be_kind_of(DRb::DRbObject)
    end

    it 'should fail because the server is not connected' do
      @server.status.should be_nil
    end
  end
  
  describe 'with mocking' do
    before(:all) do
      @server.server.stubs(:status).returns({
        :FirstProcess => { :group => 'GroupName', :status => :up },
        :SecondProcess => { :group => 'Group', :status => :unmonitored },
      })
    end
    
    it 'should retrieve the status ordered by group' do
      status = @server.status
      
      status.length.should eql(2)
      status['Group'][:SecondProcess][:status].should eql(:unmonitored)
      status['Group'][:SecondProcess][:group].should eql('Group')
      
      status['GroupName'][:FirstProcess][:status].should eql(:up)
      status['GroupName'][:FirstProcess][:group].should eql('GroupName')
    end
  end
end
