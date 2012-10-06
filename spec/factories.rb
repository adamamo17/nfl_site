FactoryGirl.define do
  factory :team do
    name    "CMU Tartans"
    abbrev  "cmu"
    url     "http://www.cmu.edu"
    division "UAA Div III"
  end
  factory :coach do
    name    "Andrew Carnegie"
    email  "andrew@cmu.edu"
    password     "siliconvalley"
    password_confirmation "siliconvalley"
    team_id  "cmu"
  end
end