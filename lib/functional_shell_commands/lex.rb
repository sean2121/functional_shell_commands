module Lex
    def next_token
    @tokens.shift
  end

  def parse(str)
    @tokens = []
    until str.empty?
      case str
      when /\A\s+/ 
      when /\A[a-zA-Z_]\w*/
    	@tokens.push [:IDENT, $&]
      when /\A->/
        @tokens.push [:ARROWOP, $&]
      when /\A\\/
        @tokens.push [:SLASH, $&]
      when /\A\(/
        @tokens.push [:LPAREN, $&]
      when /\A\*/
        @tokens.push [:ASTERISK, $&]
      when /\A\+/
        @tokens.push [:PLUS, $&]
      when /\A\)/
        @tokens.push [:RPAREN, $&]
      when /\A\d+/
        @tokens.push [:NUMBER, $&.to_i]
      when /\A\[/
        @tokens.push [:LBRACKET, $&]
      when /\A\]/
        @tokens.push [:RBRACKET, $&]
      when /\A,/
        @tokens.push [:COMMA, $&]
      when /\A"(?:[^"\\]+|\\.)*"/
        @tokens.push [:STRING, eval($&)]
      when /\A.|\n/o
        s = $&
        @tokens.push [s, s]
      end
      str = $'
    end
    @tokens.push [false, "EOF"]
    do_parse
  end
end
