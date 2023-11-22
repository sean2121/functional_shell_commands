class Sum
#include base.token
rule
#include function.rule
end

---- inner
require "functional_shell_commands/lex.rb"
include Lex

  def do_funcall(list)
	 list.send(:sum)
  end 	 
										
---- footer
require "functional_shell_commands/options.rb"
include Options	 
	 
args_check(0)
parser = Sum.new  
pipe_input = $stdin.read.strip.split(" ").map(&:to_i).to_s
str = "#{pipe_input}"
show_result = parser.parse(str)
puts show_result



