require 'yard'

module YARD
  module Parameters
    class ParameterHandler < YARD::Handlers::Ruby::Base

      handles method_call(:parameter)

      def process
        nobj = namespace
        mscope = scope
        name = statement.parameters[0].first

        if name.type == :symbol
          name = name.source[1..-1]

          register MethodObject.new(nobj, name, :class) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{nobj}.#{name}"
          end

          register MethodObject.new(nobj, "#{name}=", :class) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{nobj}.#{name}=(value)"
            o.parameters = [['value', nil]]
          end

          register MethodObject.new(nobj, name, mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}"
          end

          register MethodObject.new(nobj, "#{name}=", mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}=(value)"
            o.parameters = [['value', nil]]
          end
        end
      end

    end
  end
end
