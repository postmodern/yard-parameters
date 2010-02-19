require 'yard'

module YARD
  module Parameters
    class ParameterHandler < YARD::Handlers::Ruby::Base

      handles method_call(:parameter)

      def process
        obj = statement.parameters(false).first
        nobj = namespace
        mscope = scope
        name = case obj.type
               when :symbol_literal
                 obj.jump(:ident, :op, :kw, :const).source
               when :string_literal
                 obj.jump(:string_content).source
               end

        register MethodObject.new(nobj, name, :class) do |o|
          o.visibility = :public
          o.source = statement.source
          o.signature = "def #{name}"
        end

        register MethodObject.new(nobj, "#{name}=", :class) do |o|
          o.visibility = :public
          o.source = statement.source
          o.signature = "def #{name}=(value)"
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
