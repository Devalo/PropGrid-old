class BugReport < ApplicationRecord
  belongs_to :tenant, optional: true
  belongs_to :user, optional: true


  enum ticket_urgency: {
    "Hindrer meg i å jobbe"      => 0,
    "Hindrer meg litt i å jobbe" => 1,
    "Kan fortsette å jobbe"      => 2,
    "Til info"                   => 4,
  }

end
