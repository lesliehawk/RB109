# Password

# The following code prompts the user to set their own password
# if they haven't done so already,
# and then prompts them to login with that password.
# However, the program throws an error. What is the problem and how can you fix it?

# `verify_password': undefined local variable or method `password' for main:Object (NameError)
# Did you mean?  set_password

# set_password does not have access to password.
# It is not within its scope, and cannot be reassigned.


# Once you get the program to run without error,
# does it behave as expected?
# Verify that you are able to log in with your new password.

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
end

def verify_password(p_word) #give verify_password access to password, but passing it in)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == p_word
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  #assign password to the return value of set_password,
  #rather than attempting to reassign password within set_password,
  #where password is outside the scope of the method.
  password = set_password
end

verify_password(password)