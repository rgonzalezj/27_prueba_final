=begin
1. Crear el método request que reciba una url y el api_key y devuelva el hash con los resultados
Concatenar la API Key en la url
2. Crear un método llamado buid_web_page que reciba el hash de respuesta con todos los datos
y construya una página web. Se evaluará la página creada y tiene que tener este formato:     
=end

#NASA ID Rodrigo González Jorquera = K2rMhlaiuTIP0drR6ZkZ0HHCp6O7QgGwIVvCB7bf

require "uri"
require "net/http"
require "json"

url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=2&api_key=K2rMhlaiuTIP0drR6ZkZ0HHCp6O7QgGwIVvCB7bf")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true
request = Net::HTTP::Get.new(url)
response = https.request(request)
puts JSON.parse(response.read_body)