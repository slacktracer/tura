# Assim que entendi minimamente como funcionam módulos em Ruby tratei de
# tentar desacoplar minhas da manipulação de dados.

# Eu estou usando um Hash como fonte de dados, eu poderia ter usado um arquivo
# de texto e guardado os dados como JSON (ou eventualmente usar uma base de
# dados de verdade, mas eu não sei como fazer isso com Ruby e Sinatra =P). Usei
# a opção mais simples acreditando que não era esse ponto o mais importante do
# exercício.

# Esse modulo permite praticamente a manipulação direta dos dados que ele
# deveria administrar. Não é um grande exemplo de módulo, mas no momento quebra
# o galho.
require 'json'
module Contacts

    def Contacts.getAll()

        CONTACTS

    end

    def Contacts.getByID(id)

        contact = CONTACTS[id]
        contact['id'] = id

        contact

    end

    def Contacts.identify(id, email, name)

        puts 'identify()'
        data = {}

        CONTACTS[id]['email'] = email
        CONTACTS[id]['name'] = name
        data['id'] = id

        data = data.to_json
        data

    end

    def Contacts.register(id, url, timestamp)

        data = {}

        if id == '0'
            contact = Hash.new
            contact['visited'] = {
                url => timestamp
            }
            CONTACTS[(AUX['counter'] += 1).to_s] = contact
            data['id'] = AUX['counter'].to_s
        else
            CONTACTS[id]['visited'][url] = timestamp
            data['id'] = id
        end

        data = data.to_json
        data

    end

    CONTACTS = {}

    AUX = {
        'counter' => 0
    }

end
