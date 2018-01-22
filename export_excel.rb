require "google_drive"
require_relative "scrap_mairie.rb"

#Export vers GoogleDrive

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
session = GoogleDrive::Session.from_config("config.json")


# Worksheet link
$ws = session.spreadsheet_by_key("1wQflqIMf1UWYoJNXti-LboQTce-edzasdNRzOVXWtVo").worksheets[0]

def export
  $ws[1, 1] = "Liste des villes"
  $ws[1, 2] = "Liste des urls"
  i=2
  $Hash_mix.each { |key,value|
    $ws[i,1] = key
    $ws[i,2] = value
    i +=1
  }

  $ws.save
end
print export


=begin
#Tuto
# Gets content of A2 cell.
p ws[2, 1]  #==> "hoge"

# Changes content of cells.
# Changes are not sent to the server until you call ws.save().
ws[2, 1] = "foo"
ws[2, 2] = "bar"
ws.save

=end


=begin

# Gets list of remote files.
session.files.each do |file|
  p file.title
end

# Uploads a local file.
session.upload_from_file("/path/to/hello.txt", "hello.txt", convert: false)

# Downloads to a local file.
file = session.file_by_title("hello.txt")
file.download_to_file("/path/to/hello.txt")

# Updates content of the remote file.
file.update_from_file("/path/to/hello.txt")
=end
