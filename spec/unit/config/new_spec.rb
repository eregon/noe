require File.expand_path('../../spec_helper', __FILE__)
module Noe
  describe "Config.new" do
    
    context 'without argument' do
      subject{ Config.new }
      
      it 'should create a default configuration' do
        subject.should be_kind_of(Config)
        subject.noe_version.should == Noe::VERSION
        subject.file.should_not be_nil
      end
      
    end # without argument
    
    context 'with a hash' do
      let(:hash){ {'config_file' => File.expand_path("../config1.yaml", __FILE__)} }
      subject{ Config.new(hash) }
      
      it 'should create a configuration instance' do
        subject.file.should_not be_nil
      end
      
      it 'should have merged the default config' do
        subject.noe_version.should == Noe::VERSION
      end
      
    end # with a hash
    
    context 'with an invalid file' do
      
      it 'should raise a Noe::Error' do
        file = File.expand_path("../unexistsing.yaml", __FILE__)
        lambda{ Config.new(file) }.should raise_error(Noe::Error)
      end
      
    end # with an invalid file
    
    context 'with an valid file' do
      let(:file){ File.expand_path("../config1.yaml", __FILE__) }
      subject{ Config.new(file) }
      
      it 'should create a valid configuration' do
        subject.should be_kind_of(Config)
        subject.noe_version.should == "1.0.0"
        subject.file.should == file
      end
      
    end # with an valid file
    
  end
end