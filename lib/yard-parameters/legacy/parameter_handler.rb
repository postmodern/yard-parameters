module YARD
  module Parameters
    module Legacy
      class ParameterHandler < YARD::Handlers::Ruby::Legacy::Base

        handles /\Aparameter\s+:/

        def process
          nobj = namespace
          mscope = scope
          name = statement.tokens[2,1].to_s[1..-1]

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
