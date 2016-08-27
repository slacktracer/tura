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
