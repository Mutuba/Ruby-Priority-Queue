class GrandParent
  def say(message)
    p "GrandParent: #{message}"
  end
end

class Parent < GrandParent
end

class Child < Parent
  def say(message)
    super
  end
end

Child.new.say('Hi Rubyist!') # => "GrandParent: Hi Rubyist!"


class Parent
  def say
    yield
  end
end

class Child < Parent
  def say
    super
  end
end

Child.new.say { p 'Hi! Glad to know you Parent!' } # => "Hi! Glad to know you Parent!"

class Parent
  def say
    p "I'm the parent"
  end
end

class Child < Parent
  def say(message)
    super()
  end
end

Child.new.say('Hi!') # => "I'm the parent"


class Parent
  def say
    p "I'm the parent"
  end
end

class Child < Parent
  def say(message)
    super
  end
end

Child.new.say('Hi!') # => ArgumentError (wrong number of arguments (given 1, expected 0