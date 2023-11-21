module Options
  def args_check(expected_args_len)
    if ARGV.length != expected_args_len
      puts "wrong number of arguments (given #{ARGV.length}, expected #{expected_args_len}) exit."
      exit 
    elsif $stdin.tty?
      puts "no input given. exit."
      exit
    end
  end
end
