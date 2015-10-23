require 'faker'

def entry(fname, lname, cell)
  my_str = <<-FOO
BEGIN:VCARD
VERSION:4.0
N:#{lname};#{fname};;;
FN:#{fname} #{lname}
ORG:Bubba Gump Shrimp Co.
TITLE:Shrimp Man
PHOTO;MEDIATYPE=image/gif:http://www.example.com/dir_photos/my_photo.gif
TEL;TYPE=work,voice;VALUE=uri:tel:+#{cell}
REV:20080424T195243Z
END:VCARD
FOO

  return my_str
end



file = File.open("./contacts.vcf", "w")

400.times do
  fname = "CCC#{Faker::Name.first_name}" #=> "Kaci"

  lname = "#{Faker::Name.last_name}" #=> "Ernser"
  #name = "A#{Faker::Name.name}"


  Faker::Config.locale = 'en-US'

  cell = "1#{Faker::PhoneNumber.exchange_code}#{Faker::PhoneNumber.exchange_code}#{Faker::PhoneNumber.subscriber_number}"

  puts "#{fname} #{lname}"
  puts cell

  e = entry(fname, lname, cell)

  file.write(e)
  file.write("\n")
end

file.close
