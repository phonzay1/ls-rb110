=begin
Problem
Inputs:
- a string with multiple words that indicate commands
Outputs:
- perform operations with the various integers input as commands: adding/removing
them from the `stack`, reassigning the register value to them, performing mathematical
calculations, etc
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- initialize local variable `register` to 0
- initialize local variable `stack` to an array
- split input string into an array of words

- define a helper method `command_operations` that takes a command, a register, and an array
as arguments
  - define what operations the various commands should perform:
    - if the command has an appropriate integer version of itself, assign the integer
    version of itself to the register
    - otherwise, follow the command operations outlined in the problem statement
----------------------------------------------------------
Algorithm
- define the main method, `minilang`, which takes a string as an argument
  - initialize a local variable `register` to 0
  - initialize a local variable `stack` to an empty array
  - initialize a variable `commands` and assign it to the result of splitting the input
  string into its individual words
  - iterate over each word in `commands`:
    - define what operation should happen, based on the value of the command in
    each iteration
      - if the command has an appropriate integer version of itself, assign the integer
      version of itself to `register`
      - otherwise, follow the command operations outlined in the problem statement
----------------------------------------------------------
=end

def minilang(command_str)
  register = 0
  stack = []
  commands = command_str.split

  commands.each do |command|
    if Integer(command, exception: false)
      register = command.to_i
    elsif command == 'PUSH' || command == 'PRINT'
      command == 'PUSH' ? stack.push(register) : puts(register)
    else
      if stack.empty?
        puts "Unable to perform command; stack is empty"
      else
        case command
        when 'ADD' then register += stack.pop
        when 'SUB' then register -= stack.pop
        when 'MULT' then register *= stack.pop
        when 'DIV' then register /= stack.pop
        when 'MOD' then register %= stack.pop
        when 'POP' then register = stack.pop
        else puts "Sorry, '#{command}' is not a valid command"
        end
      end
    end
  end
end

#----TESTS FOR FURTHER EXPLORATION ERROR MESSAGES-----
# minilang('3 PUSH PRINT TWIST')
# minilang('MULT DIV PRINT')

#--------
# minilang('PRINT')
# puts "---"
# minilang('5 PUSH 3 MULT PRINT')
# puts "---"
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# puts "---"
# minilang('5 PUSH POP PRINT')
# puts "---"
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# puts "---"
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# puts "---"
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# puts "---"
# minilang('-3 PUSH 5 SUB PRINT')
# puts "---"
# minilang('6 PUSH')

# minilang('3 PUSH PUSH PUSH PUSH PUSH PUSH ADD SUB MULT DIV MOD POP PRINT')


#----FURTHER EXPLORATION-------
# Try writing a minilang program to evaluate and print the result of this expression:
# (3 + (4 * 5) - 7) / (5 % 3)

minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')