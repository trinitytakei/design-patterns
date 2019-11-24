class LoggerBuilder < Module
  def initialize(method_name)
    # this is how we define a method dynamically (via method_name variable)
    # Module does the same under the hood
    define_method method_name do |*args, &block|
      puts "calling #{self.class}##{method_name} with #{args}..."
      super(*args, &block)
    end
  end
end

# with customizable logger method (instead of hardcoded Kernel.puts)

# class LoggerBuilder < Module
#   def initialize(method_name, logger)
#     define_method method_name do |*args, &block|
#       logger.call "calling #{self.class}##{method_name} with #{args}..."
#       super(*args, &block)
#     end
#   end
# end

# It's questionable whether this is worth the amount of redirection / complexity
# Maybe the puts could be recirected from STDOUT -> best of both worlds?