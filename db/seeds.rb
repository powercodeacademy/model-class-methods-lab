cook = Captain.create(name: 'Captain Cook', admiral: true)
kidd = Captain.find_or_create_by(name: 'Captain Kidd') { |c| c.admiral = true }
william = Captain.find_or_create_by(name: 'William Kyd') { |c| c.admiral = false }
arel = Captain.find_or_create_by(name: 'Arel English') { |c| c.admiral = true }
henry = Captain.find_or_create_by(name: 'Henry Hudson') { |c| c.admiral = false }
samuel = Captain.find_or_create_by(name: 'Samuel Axe') { |c| c.admiral = false }

h_28 = Boat.find_or_create_by(name: 'H 28') { |b| b.length = 27 }
nacra_17 = Boat.find_or_create_by(name: 'Nacra 17') { |b| b.length = 17 }
regulator = Boat.find_or_create_by(name: 'Regulator 34SS') { |b| b.length = 34 }
zodiac = Boat.find_or_create_by(name: 'Zodiac CZ7') { |b| b.length = 24 }
boston_whaler = Boat.find_or_create_by(name: 'Boston Whaler') { |b| b.length = 13 }
forty_niner = Boat.find_or_create_by(name: '49er') { |b| b.length = 16 }
cape_dory = Boat.find_or_create_by(name: 'Cape Dory') { |b| b.length = 28 }
laser = Boat.find_or_create_by(name: 'Laser') { |b| b.length = 14 }
triton = Boat.find_or_create_by(name: 'Triton 21 TRX') { |b| b.length = 21 }
sun_tracker = Boat.find_or_create_by(name: 'Sun Tracker Regency 254 XP3') { |b| b.length = 27 }
harpoon = Boat.find_or_create_by(name: 'Harpoon 4.7') { |b| b.length = 15.5 }
sunfish = Boat.find_or_create_by(name: 'Sunfish') { |b| b.length = 13.7 }

h_28.captain = cook
nacra_17.captain = kidd
regulator.captain = william
zodiac.captain = arel
boston_whaler.captain = henry
forty_niner.captain = samuel
cape_dory.captain = cook
laser.captain = cook
triton.captain = arel
sun_tracker.captain = samuel

h_28.save
nacra_17.save
regulator.save
zodiac.save
boston_whaler.save
forty_niner.save
cape_dory.save
laser.save
triton.save
sun_tracker.save

ketch = Classification.find_or_create_by(name: 'Ketch')
sailboat = Classification.find_or_create_by(name: 'Sailboat')
catamaran = Classification.find_or_create_by(name: 'Catamaran')
sloop = Classification.find_or_create_by(name: 'Sloop')
motorboat = Classification.find_or_create_by(name: 'Motorboat')
center = Classification.find_or_create_by(name: 'Center Console')
rib = Classification.find_or_create_by(name: 'RIB')
trawler = Classification.find_or_create_by(name: 'Trawler')
cat_rig = Classification.find_or_create_by(name: 'Cat Rig Boat')
bass = Classification.find_or_create_by(name: 'Bass Boat')
pontoon = Classification.find_or_create_by(name: 'Pontoon Boat')

[[h_28, [ketch, sailboat]],
 [nacra_17, [catamaran, sloop, sailboat]],
 [regulator, [motorboat, center]],
 [zodiac, [rib, motorboat, center]],
 [boston_whaler, [motorboat]],
 [forty_niner, [sailboat, sloop]],
 [cape_dory, [motorboat, trawler]],
 [laser, [sailboat, cat_rig]],
 [triton, [motorboat, bass]],
 [sun_tracker, [motorboat, pontoon, catamaran]],
 [harpoon, [sailboat, sloop]],
 [sunfish, [sailboat, cat_rig]]].each do |boat, classes|
  classes.each do |classification|
    boat.classifications << classification unless boat.classifications.include?(classification)
  end
end
