class Map
#include base.token
rule
#include higher_order_function.rule
end

---- inner
require "../lib/functional_shell_commands/lex.rb"
include Lex

  def do_higher_order_funcall(higher_order_func, predicate_func, list)
    list.public_send(higher_order_func) do |element|
      element.public_send(*predicate_func)
    end
  end 													
										
---- footer
require "./options.rb"											  
include Options

args_check(1)											  
pipe_input = $stdin.read.strip.split("\n")
									 										
parser = Map.new											  
ARGV.unshift("map")

input  = pipe_input.first.split(" ").map(&:to_i)

str = ARGV.join(" ") + input.to_s											  
show_result = parser.parse(str)
puts show_result.join(",")


