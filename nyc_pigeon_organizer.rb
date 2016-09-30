require 'pry'

# pigeon_data = {
#   :color => {
#     :purple => ["Theo", "Peter Jr.", "Lucky"],
#     :grey => ["Theo", "Peter Jr.", "Ms. K"],
#     :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
#     :brown => ["Queenie", "Alex"]
#   },
#   :gender => {
#     :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
#     :female => ["Queenie", "Ms. K"]
#   },
#   :lives => {
#     "Subway" => ["Theo", "Queenie"],
#     "Central Park" => ["Alex", "Ms. K", "Lucky"],
#     "Library" => ["Peter Jr."],
#     "City Hall" => ["Andrew"]
#   }
# }

def nyc_pigeon_organizer(data)
  # Create a hash for results
  new_hash = {}

  # Get array of unique names
  pigeon_names = data.collect do |attributes, details|
    details.values
  end
  .flatten.uniq

  # Create hash with each name as key
  # {"Theo"=> {}, "Peter" => {},...}
  pigeon_names.each {|name| new_hash[name] = {}}

  # Create keys(categories for each pigeon) with value of empty array
  data.each do |attributes, details|
    new_hash.each do |name, hash|
      new_hash[name][attributes] = []
    end
  end

  # Assign info to each key
  data.each do |attribute, details|
    details.each do |property, names|
      names.each do |name|
        new_hash[name][attribute] << property.to_s
      end
    end
  end
  new_hash
end
