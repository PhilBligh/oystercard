class Oystercard
    MAX_LIMIT = 90
    def initialize
        @balance = 0
    end

    attr_accessor :balance

    def top_up(amount)
        fail "Cannot top up as you exceeded the maximum limit" if @balance + amount > MAX_LIMIT
        @balance += amount
    end

end

        