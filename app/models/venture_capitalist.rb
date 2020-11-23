class VentureCapitalist
    @@all = []
    @@trés_Commas_Club = []
    attr_reader :name, :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
       if @total_worth >= 1000000000
            @@trés_Commas_Club << self
       end
    end

    def self.all
        @@all
    end       

    def self.tres_commas_club
        @@trés_Commas_Club
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self} 
    end

    def portfolio
        startups = self.funding_rounds.map { |funding_round| funding_round.startup}
        startups.uniq
    end

    def biggest_investment
        max_investment = 0
        self.funding_rounds.each do |funding_round|
            if funding_round.investment > max_investment
                max_investment = funding_round.investment
            end
        end
        self.funding_rounds.find {|funding_round| funding_round.investment == max_investment }
    end

    def invested(domain)
        total = 0
        investment = self.funding_rounds.select {|funding_round| funding_round.startup.domain == domain}
        investment.each { |investments| total += investments.investment }
        total
    end

end
