class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        actors = []
        self.auditions.each do |aud|
            actors << aud.actor
        end
        actors
    end

    def locations
        locations = []
        self.auditions.each do |aud|
            locations << aud.location
        end
        locations
    end

    def lead
        hired_actors = []
        self.auditions.each do |aud|
            if aud.hired = true
                hired_actors << aud
            end
        end
        if hired_actors.length > 0
            hired_actors[0]
        else
            'No actor has been hired for this role'
        end
    end

    def understudy
        hired_actors = []
        self.auditions.each do |aud|
            if aud.hired = true
                hired_actors << aud
            else
                'No actor has been hired for this role'
            end
        end
        if hired_actors.length > 1
            hired_actors[1]
        else
            'No actor has been hired for this role'
        end
    end
end