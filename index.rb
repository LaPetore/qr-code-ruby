require "rqrcode"

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("wikipedia qr code")


# Use the .as_png method to create a 500 pixels by 500 pixels image 
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("sometext.png", png.to_s)

p "What kind of QR code to you want?"
puts
p "1. Open a URL"
p "2. Join a wifi"
p "3. Send a text message"
p "4. Exit the program"

my_response = gets.chomp("\n").to_i


while my_response != 4
  if my_response == 1
    p "What kind of url would you like to enter?"

    my_website = gets.chomp("\n")

    qrcode = RQRCode::QRCode.new(my_website)
  elsif my_response == 2
    p "What is the name of the wifi's network?"
    my_wifi_name = gets.chomp("\n")
    
    p "What's the wifi's password?"
    my_wifi_password = gets.chomp("\n")

    my_website = "WIFI:T:WPA;S:#{my_wifi_name};P:#{my_wifi_password};;"

  elsif my_response == 3
    p "What is your phone number for me to text?"
    my_phone_number = gets.chomp("\n").to_i

    p "What message do you want to send?"
    my_message = gets.chomp("\n")

    SMSTO:(224) 678-2052: Hi Peter. This is Peter speaking. 
  elsif my_response == 4
    break
  else 
    p "What? I didn't understand you. Select from the options 1 to 4."
  end

end
