# coding: UTF-8

# カスタムマッチャーに関するもの
# @author Nozomu Kanechika
# @since 4.1.3
module Matchers

  # ハッシュの中に含まれるかどうか
  # @author Nozomu Kanechika
  # @since 4.1.3
  class BeHashIncluding

    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      @actual = actual
      @expected.each_pair do |k,v|
        #if !v.is_a?(Array) and !v.is_a?(Hash)
          unless @actual[k]==v
            @error = "'#{k} => #{@expected[k].inspect}' but got '#{k} => #{v.inspect}'"
            return false
          end
        #end
      end
      return true
    end

    def failure_message
      #"expected '#{@expected.inspect}' but got '#{@actual.inspect}'"
      "expected #{@error}"
    end

    def negative_failure_message
      #"expected something else then '#{@expected.inspect}' but got '#{@actual.inspect}'"
      "expected something else then #{@error}"
    end

  end

  def be_hash_including expected
    BeHashIncluding.new(expected)
  end

end

