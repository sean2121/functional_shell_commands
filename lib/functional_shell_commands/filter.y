class Filter
#include base.token
rule
#include higher_order_function.rule
end

---- inner
require "../lib/functional_shell_commands/lex.rb"
include Lex

  def do_higher_order_funcall(higher_order_func, predicate_func, collection)
    collection.public_send(higher_order_func) do |item|
	   item.public_send(mapping(predicate_func))
    end
  end

  def mapping(predicate_func)
	case predicate_func
	when "even" then
      "even?"
	else
	  raise "#{predicate_func} is not expected as prediate functions"
	end			
  end 													
										
---- footer
parser = Filter.new								   
ARGV.unshift("select")
pipe_input = $stdin.read.strip.split(" ").map(&:to_i).to_s
str = ARGV.join(" ") + pipe_input
show_result = parser.parse(str)
puts show_result.join(",")




