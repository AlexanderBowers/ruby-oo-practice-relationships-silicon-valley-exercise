class Startup
    @@all = []
    @@domains = []
    attr_reader :founder
    attr_accessor :name, :domain, :big_investors

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domains << domain
        @investors = []
        @big_investors = []
        @funding_rounds = 0
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
       self.all.find {|startup| startup.founder.name == founder}
    end

    def self.domains
        @@domains.uniq
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
        @funding_rounds += 1
        @investors << venture_capitalist.name
        if VentureCapitalist.tres_commas_club.include?(venture_capitalist)
            @big_investors << venture_capitalist.name
        end
    end

    def num_funding_rounds
        @funding_rounds
    end

    def total_funds
        total = 0
        FundingRound.all.each do |funding_round|
            if funding_round.startup == self
                total += funding_round.investment
            end
        end
        total
    end
    
    def investors
        @investors.uniq
    end

    def self.big_investors
        @@big_investors.uniq
    end
    

end
