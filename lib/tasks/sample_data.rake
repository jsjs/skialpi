namespace :db do
  
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",                        
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 sex: "m",
                 show_age: true,
                 birthdate: "1990-01-01",
                 show_email: true)
      admin.toggle!(:admin)           
    50.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      sx = %w[ m f ].shuffle
      user_sex = sx[0]
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   sex: user_sex,
                   show_age: true,
                   birthdate: "1990-01-01",
                   show_email: true)
    end
    
  end
  
  # desc "Fill database with tracks"
  # task fill_tracks: :environment do
  
  #   50.times do |n|
  #     location_name = "Location-#{n}"
  #     location_access = Faker::Lorem.sentence(5)
  #     location_description = Faker::Lorem.sentence(10)
  #     location_conditions = Faker::Lorem.sentence(5)
      
  #     Location.create!( name: location_name,
  #                       description: location_description,
  #                       conditions: location_conditions,
  #                       access: location_access)
  #   end
    
  #   @locations = Location.all
    
  #   @locations.each do |location|
  #     20.times do |n|
  #       location.areas.create!(name: "#{location.id}:Area-#{n}", description: Faker::Lorem.sentence(3))
  #     end
  #   end
    
  #   @areas = Area.all
    
  #   difficulties = %w[ S1 S2- S2 S2+ S3- S3 S3+ S4- S4 S4+ S5- S5 S5+ S6 ]
  #   exposures = %w[ E1 E2 E3 E4 ]
  #   alts = []
  #   (700 .. 4000).map do |x|
  #     alts << x
  #   end
    
  #   slps = []
  #   (20 .. 80).map do |x|
  #     slps << x
  #   end
    
    
  #   @areas.each do |area|
  #     40.times do |n|
  #       t_name = "A:#{area.id}:Track-#{n}"
  #       t_description = Faker::Lorem.sentence(3)
  #       t_note = Faker::Lorem.sentence(1)
  #       t_alt = alts.shuffle.first
  #       t_slp = slps.shuffle.first
  #       t_dif = difficulties.shuffle.first
  #       t_exp = exposures.shuffle.first
  #       area.tracks.create!( name: t_name,
  #                            description: t_description,
  #                            note: t_note,
  #                            altitude: t_alt,
  #                            slope: t_slp,
  #                            difficulty: t_dif,
  #                            exposure: t_exp )
  #     end  
  #   end   
  # end
  
  
  
  desc "Fill database with achievements"
  task fill_achievements: :environment do
    users = User.all(limit: 30)
    
    date = "2013-01-01"
    time = "5:34"
    users.each do |user|
      15.times do
        track = Track.find(rand(1..100))
        user.create_achievement(track, date, time, note)
      end
    end 
  end
  
end
