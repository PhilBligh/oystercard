 require 'station'

class Oystercard
    MAX_LIMIT = 90
    MIN_LIMIT = 1

    def initialize
        @balance = 0
        @status = false
    end

    attr_accessor :balance, :status, :entry_station

    def top_up(amount)
        fail "Cannot top up as you exceeded the maximum limit of #{MAX_LIMIT}" if @balance + amount > MAX_LIMIT
        @balance += amount
    end

    
    def touch_in(station)
        fail "Not enough funds on your Oystercard" if @balance < MIN_LIMIT
        @entry_station = station
        @status = true
    end
    
    def touch_out
        deduct(MIN_LIMIT)
        @status = false
    end
    
    def in_journey?
        @status
    end

    private

    def deduct(fare) #likely to be updated
        @balance -= fare
    end
    
end

