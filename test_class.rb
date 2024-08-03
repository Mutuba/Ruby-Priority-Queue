# class Foo
#   def method_missing name, *args, &block
#     p args
#   end

#   def respond_to_missing? name, *args, &block
#     true
#   end
# end

# f = Foo.new
# f.bar  #=> []
# p f.respond_to? :bar  #=> true
# p f.method :bar  # NameError: undefined method `bar' for class `Foo'

module MutubaTest
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def set_association
      mutuba_private
    end

    private

    def mutuba_private
      puts 'I am private called from an inner module'
    end
  end
end

class Test
  include MutubaTest
end

p Test.set_association
