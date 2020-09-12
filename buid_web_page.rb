=begin
1. Crear el método request que reciba una url y el api_key y devuelva el hash con los resultados
Concatenar la API Key en la url
2. Crear un método llamado buid_web_page que reciba el hash de respuesta con todos los datos
y construya una página web. Se evaluará la página creada y tiene que tener este formato:     
=end

#NASA ID Rodrigo González Jorquera = K2rMhlaiuTIP0drR6ZkZ0HHCp6O7QgGwIVvCB7bf

require "uri"
require "openssl"
require "net/http"
require "json"

def request(urlweb, api_key)
url = URI("#{urlweb}api_key=#{api_key}") 

https = Net::HTTP.new(url.host, url.port);
request = Net::HTTP::Get.new(url)
response = https.request(request)
https.use_ssl = true
info = response.read_body
info = JSON.parse(info)



url_nasa= "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000"
#url https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=K2rMhlaiuTIP0drR6ZkZ0HHCp6O7QgGwIVvCB7bf
api_key= "K2rMhlaiuTIP0drR6ZkZ0HHCp6O7QgGwIVvCB7bf"

nasa_pics = request(url_nasa, api_key)

output_nasa = {}
f = 0
url_nasa["photos"].each do |hash|
    hash.each do |key, value|
        if key == "img_src"
            url_nasa["key#{f}"] = value
            f += 1
        end
    end
    print output_nasa
end


def build_web_page(output_nasa)
    head = '<title>Fotos NASA</title>
	<meta name="description" content="Fotos de la NASA para nave Curiosity,ordenadas por li para la prueba dee DLG34"/>
    <meta name="keywords" content="nasa, curiosity, marte, fotos de la nasa"/>
    <meta name="author" content="Rodrigo González Jorquera" />
    <meta name="doc-type" content="web page" />
    <link rel="shortcut icon" href="https://api.nasa.gov/assets/img/favicons/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">'
    
    body = "<ul></ul>"
    footer = '<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
  </html>'

    web = (head+body+footer)
    
    output_nasa.each do |key, value|
        value.each do |i|
            body += "<li><img_src=#{i}>...</img></li>"
        end
    end
    return web
    File.write('fotos-nasa.html', html)
    website_nasa = build_web_page(data)
end

=begin
Pregunta bonus: Crear un método photos_count que reciba el hash de respuesta y devuelva
un nuevo hash con el nombre de la camara y la cantidad de fotos.
=end

def pic_counting(output_nasa)
    pictures_hash = {}
    output_nasa.each do |key, value|
    pictures_hash[key] = value.size
    end
    return pictures_hash
    end
end

nasa_pics = pic_counting(data)
print nasa_pics
