class Mean
#include base.token
rule
#include function.rule
end

---- inner
require "../lib/functional_shell_commands/lex.rb"
include Lex

  def do_funcall(list)	
	 list.sum(0.0) / list.length
  end 	 
										
---- footer
require "./options.rb"
include Options

args_check(0)	 
parser = Mean.new								   
pipe_input = $stdin.read.strip.split(" ").map(&:to_i).to_s
str = "#{pipe_input}"
show_result = parser.parse(str)
puts show_result



