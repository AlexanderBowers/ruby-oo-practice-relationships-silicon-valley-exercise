class FundingRound

    @@all = []
    attr_reader :startup, :venture_capitalist, :type
    attr_accessor :investment

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        investment = investment.to_f
        @investment = investment
        @type = type
        @@all << self
    end

    def self.all
        @@all
    end




end
