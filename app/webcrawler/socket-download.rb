
require 'socket'

host1 = '19ca.vd.aclst.com'
host = "youtube.com"
q = "get?video_id=KMU0tzLwhbE&ts_create=1458165622&r=MTc3LjEwMC43OC4xMTQ%3D&h2=749858681ef6f778f35ab7a8767655f9&s=179285"
port = 80
q1 = "dl.php/KMU0tzLwhbE/Developers.mp3?video_id=KMU0tzLwhbE&t=S01VMHR6THdoYkUtMjk3NjE0MDkxNC0xNDU4MTY1NjYxLTQ3NzUwMA%3D%3D&exp=19-03-2016&s=2600d680de8d1845c617df8d22dbd25f"
s = TCPSocket.open host, port
s.puts "GET / HTTP/1.1\r\n"
s.puts "Host: #{host}"
s.puts "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
s.puts "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7"
s.puts "\r\n"

while line = s.gets
  puts line.chop
end


s.close
#http://www.youtube-mp3.org/get?video_id=KMU0tzLwhbE&ts_create=1458165622&r=MTc3LjEwMC43OC4xMTQ%3D&h2=749858681ef6f778f35ab7a8767655f9&s=179285

#http://19ca.vd.aclst.com/dl.php/KMU0tzLwhbE/Developers.mp3?video_id=KMU0tzLwhbE&t=S01VMHR6THdoYkUtMjk3NjE0MDkxNC0xNDU4MTY1NjYxLTQ3NzUwMA%3D%3D&exp=19-03-2016&s=2600d680de8d1845c617df8d22dbd25f


