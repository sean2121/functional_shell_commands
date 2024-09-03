class Foldl
#include base.token
rule
#include higher_order_function.rule
end

---- inner
require "functional_shell_commands/lex.rb"
include Lex

  def do_higher_order_funcall(higher_order_func, predicate_func, accumulator, list)
    list.public_send(*[higher_order_func, accumulator]){|acc, element| acc.send(*[predicate_func,element])}
  end 			

test
										
---- footer

parser = Foldl.new								   
ARGV.unshift("inject")
#TODO: fix 
pipe_input = $stdin.read.strip.split("\n")
input = pipe_input.first.split(" ").map(&:to_i)

str = ARGV.join(" ") + input.to_s
show_result = parser.parse(str)
puts show_result


