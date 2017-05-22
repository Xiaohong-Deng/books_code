module CallerTools
  # tidy up the trace making it more readable
  class Call
    CALL_RE = /(.*):(\d+):in `(.*)'/
    attr_reader :program, :line, :meth
    def initialize(string)
      @program, @line, @meth = CALL_RE.match(string).captures
    end

    def to_s
      "%30s%5s%15s" % [program, line, meth]
    end
  end

  # a Stack used to store trace calls
  class Stack
    def initialize
      # get the stack trace
      stack = caller
      # remove the call from Stack.new
      # Stack.new calls initialize
      stack.shift
      @backtrace = stack.map do |call|
        Call.new(call)
      end
    end

    def report
      @backtrace.map do |call|
        call.to_s
      end
    end

    def find(&block)
      @backtrace.find(&block)
    end
  end
end
