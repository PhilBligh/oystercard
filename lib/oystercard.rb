require_relative 'journey'

class Oystercard
    MAX_LIMIT = 90
    MIN_LIMIT = 1

    def initialize
        @balance = 10
        @status = false
        @journey_list = []
    end

    attr_accessor :balance, :status, :journey_list

    def top_up(amount)
        fail "Cannot top up as you exceeded the maximum limit of #{MAX_LIMIT}" if @balance + amount > MAX_LIMIT
        @balance += amount
    end

    
    def touch_in(station)
        fail "Not enough funds on your Oystercard" if @balance < MIN_LIMIT
        @journey = Journey.new
        @journey.journey_start(station)
        @status = true
    end
    
    def touch_out(station)
        @journey.journey_end(station)
        @journey_list << @journey
        # deduct(journey)
        # @status = false
    end
    
    # def in_journey?
    #     !!@entry_station
    # end


    private

    def deduct(fare) #likely to be updated
        @balance -= fare
    end
    
end

