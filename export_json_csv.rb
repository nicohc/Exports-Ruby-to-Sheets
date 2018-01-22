#Export vers JSON

require 'json'
require 'csv'

File.open("listing.json","w") do |f|
  f.write($Hash_mix.to_json)
end


CSV.open("listing.csv", "wb") {|csv|
  $Hash_mix.to_a.each {|elem| csv << elem}
}
