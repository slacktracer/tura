require 'json'
require 'sinatra'
require 'slim'

require './modules/contacts.rb'

# Esse o path que define endereço e nome para um visitante.
# Tanto nesse caso como no path /register eu preferia ter usado o método post.
# Esse get não exatamente idempotente... Eu acredito que os verbos HTTP devem
# ser empregados corretamente, mas o tempo não me permitiu conseguir fazer um
# post cross-domain. Bem que eu tentei.
get '/identify' do
    callback = params.delete('callback') # jsonp

    data = Contacts.identify(params['id'], params['email'], params['name'])

    content_type :js
    response = "#{callback}(#{data})"
    response
end

# Eis uma boa questão. Do modo que a aplicação funciona agora, toda visita a
# qualquer pagina é registrada e quando o usuário envia um contato as visitas
# são associadas a um endereço e um nome.

# O exemplo de uso no exercício insinua que um contato na aplicação é criado
# apenas quando um visitante envia um contato.

# Uma opção seria guardar as páginas visitadas num cookie e enviar apenas quando
# o visitante fizer um contato. Mas árta que futuras visitas a outras páginas
# sejam devidamente registradas achei por bem registrar cada visita identificada
# apenas por um id e eventualmente associar esse id com um endreço e nome. Em
# teoria esse "perfil" de visitante vai sendo aprimorado conforme novas
# informações são adquiridas.

# (Melhor ainda se a biblioteca js verificar se o visitante já tem aquela página
# registrada. Não sei se vou ter oportunidade de implementar isso neste
# exercício. Ou talvez o horário da última visita em cada página seja
# relevante...)
get '/register' do
    callback = params.delete('callback') # jsonp

    data = Contacts.register(params['id'], params['url'], params['timestamp'])

    content_type :js
    response = "#{callback}(#{data})"
    response
end

get '/contacts/:id' do
    @contact = Contacts.getByID(params['id'])
    slim :contact
end

get '/' do
    @contacts = Contacts.getAll()
    slim :index
end

# https://pooreffort.com/blog/testing-sinatra-apis/
