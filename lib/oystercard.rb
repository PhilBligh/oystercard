#  require 'station'

class Oystercard
    MAX_LIMIT = 90
    MIN_LIMIT = 1

    def initialize
        @balance = 0
        @status = false
        @journey = {}
        @journey_list = []
    end

    attr_accessor :balance, :status, :entry_station, :exit_station, :journey_list, :journey

    def top_up(amount)
        fail "Cannot top up as you exceeded the maximum limit of #{MAX_LIMIT}" if @balance + amount > MAX_LIMIT
        @balance += amount
    end

    
    def touch_in(station)
        fail "Not enough funds on your Oystercard" if @balance < MIN_LIMIT
        @journey = {}
        @entry_station = station
        @journey[:entry_station] = station
        @exit_station = nil
        @status = true
    end
    
    def touch_out(exit_station)
        @exit_station = exit_station
        @journey[:exit_station] = exit_station
        @journey_list << @journey
        deduct(MIN_LIMIT)
        @entry_station = nil
        @status = false
    end
    
    def in_journey?
        !!@entry_station
    end


    private

    def deduct(fare) #likely to be updated
        @balance -= fare
    end
    
end

