class Oystercard
    MAX_LIMIT = 90

    def initialize
        @balance = 0
        @status = false
    end

    attr_accessor :balance, :status

    def top_up(amount)
        fail "Cannot top up as you exceeded the maximum limit of #{MAX_LIMIT}" if @balance + amount > MAX_LIMIT
        @balance += amount
    end

    def deduct(fare)
        @balance -= fare
    end

    def touch_in
        @status = true
    end

    def touch_out
        @status = false
    end

    def in_journey?
        @status
    end

end

        