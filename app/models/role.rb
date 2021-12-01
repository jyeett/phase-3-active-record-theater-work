class Role < ActiveRecord::Base
    has_many :auditions

    def auditions
        Audition.where({role_id: self.id})
    end

    def actors
        auds = Audition.where({role_id: self.id})
        auds.map do |audition|
            audition[:actor]
        end
    end

    def locations
        auds = Audition.where({role_id: self.id})
        auds.map do |audition|
            audition[:location]
        end
    end

    def lead
        auds = Audition.where({role_id: self.id})
        if auds.length == 0
            return 'no actor has been hired for this role'
        end
        auds.first
    end

    def understudy
        auds = Audition.where({role_id: self.id})
        if auds.length == 0
            return 'no actor has been hired for this role'
        end
        auds.second
    end
end