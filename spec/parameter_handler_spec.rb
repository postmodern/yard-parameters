require 'spec_helper'
require 'helpers/examples'

require 'yard-parameters/parameter_handler'
require 'yard-parameters/legacy/parameter_handler'

describe "ParameterHandler" do
  include Helpers::Examples

  describe "valid" do
    before(:all) do
      parse_file :simple_parameter
    end

    it "should register a class reader method for the parameter" do
      yard('SimpleParameter.x').should be_instance_of(CodeObjects::MethodObject)
    end

    it "should register a class writer method for the parameter" do
      yard('SimpleParameter.x=').should be_instance_of(CodeObjects::MethodObject)
    end

    it "should register a instance reader method for the parameter" do
      yard('SimpleParameter#x').should be_instance_of(CodeObjects::MethodObject)
    end

    it "should register a instance writer method for the parameter" do
      yard('SimpleParameter#x=').should be_instance_of(CodeObjects::MethodObject)
    end
  end

  describe "invalid" do
    before(:all) do
      parse_file :bad_parameter
    end

    it "should not register class reader methods for variables" do
      yard('BadParameter.x').should be_nil
    end

    it "should not register class writer methods for variables" do
      yard('BadParameter.x=').should be_nil
    end

    it "should not register instance reader methods for variables" do 
      yard('BadParameter#x').should be_nil
    end

    it "should not register instance writer methods for variables" do
      yard('BadParameter#x=').should be_nil
    end
  end
end
