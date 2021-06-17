# Consider these two simple methods.
# What would be the return value of the method invocation?

def foo(param = "no")
  "yes"
end
#=> 'yes'

def bar(param = "no")
  param == "no" ? "yes" : "no" # false bc param passed in was 'yes'
end
#=> 'no'

bar(foo)
#=> no

