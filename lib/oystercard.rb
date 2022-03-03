require_relative 'journey'

class Oystercard
    MAX_LIMIT = 90
    MIN_LIMIT = 1

    def initialize
        @balance = 0
        @in_journey = false
        @journey_list = []
        @penalty = 6
    end

    attr_accessor :balance, :status, :journey_list, :journey, :in_journey

    def top_up(amount)
        fail "Cannot top up as you exceeded the maximum limit of #{MAX_LIMIT}" if @balance + amount > MAX_LIMIT
        @balance += amount
    end

    
    def touch_in(station)
        fail "Not enough funds on your Oystercard" if @balance < MIN_LIMIT
        if in_journey?
            deduct(penalty)
        end
        @journey = Journey.new
        @journey.journey_start(station)
        @in_journey = true
    end
    
    def touch_out(station)
        @journey.journey_end(station)
        if in_journey? == false
          deduct(penalty)
        else
          @journey_list << @journey
          deduct(@journey.fare)
        end
        @in_journey = false
    end
    
    def in_journey?
       @in_journey
    end
    

    private

    def deduct(fare) #likely to be updated
        @balance -= fare
    end
    
end

