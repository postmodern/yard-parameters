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

    it "should define a class reader method for the parameter" do
      yard('SimpleParameter.x').should be_instance_of(CodeObjects::MethodObject)
    end

    it "should define a class writer method for the parameter" do
      yard('SimpleParameter.x=').should be_instance_of(CodeObjects::MethodObject)
    end

    it "should define a instance reader method for the parameter" do
      yard('SimpleParameter#x').should be_instance_of(CodeObjects::MethodObject)
    end

    it "should define a instance writer method for the parameter" do
      yard('SimpleParameter#x=').should be_instance_of(CodeObjects::MethodObject)
    end
  end

  describe "invalid" do
    before(:all) do
      parse_file :bad_parameter
    end

    it "should not define methods for variables named 'parameter'" do
      yard('BadParameter.x').should be_nil
      yard('BadParameter.x=').should be_nil
      yard('BadParameter#x').should be_nil
      yard('BadParameter#x=').should be_nil
    end
  end
end
