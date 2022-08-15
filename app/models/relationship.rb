class Relationship < ApplicationRecord
    delongs_to :follower, class_name: "User"
    delongs_to :followed, class_name: "User"
    
end
