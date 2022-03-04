require_relative 'journey'
require_relative 'journey_list'

class Oystercard
    MAX_LIMIT = 90
    MIN_LIMIT = 1

    def initialize
        @balance = 0
        @in_journey = false
        @my_list = JourneyList.new
        @penalty = 6
    end

    attr_accessor :balance, :status, :journey_list, :journey, :in_journey, :my_list, :penalty

    def top_up(amount)
        fail "Cannot top up as you exceeded the maximum limit of #{MAX_LIMIT}" if @balance + amount > MAX_LIMIT
        @balance += amount
    end

    
    def touch_in(station)
        fail "Not enough funds on your Oystercard" if @balance < MIN_LIMIT
        if in_journey?
            deduct(@penalty)
        end
        @my_list.journey_start(station)
        @in_journey = true
    end
    
    def touch_out(station)
        @my_list.journey_end(station)
        if in_journey? == false
          deduct(@penalty)
        else
        #   @my_list.journey_list << @my_list.trip
          deduct(@my_list.trip.fare)
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

