#!/usR/bin/env ruby

class User
  def null_user
    User::Null.new
  end

  class Null
    def speak
      puts "hi"
    end
  end
end

puts User::Null.new.speak