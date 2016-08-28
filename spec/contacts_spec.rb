puts 'N.A.F.T.A. (Not A Fancy Testing Algorithm) is on!'

puts 'Testing Contacts module:'
require_relative '../modules/contacts.rb'

puts '1) CONTACTS hash should empty'

if Contacts::CONTACTS == {}
    puts 'Alright! Test 1 Passed'
else
    puts 'Something went Wrong.'
    puts 'CONTACTS hash  is:'
    puts Contacts::CONTACTS
    puts 'Aborting.'
    exit(1)
end

puts '2) After registering a visit to HOME the CONTACTS hash must have a visit registered with id 1 and the HOME page set as visited'

puts 'Registering visit by new visitor (id = "0", url = "HOME", timestamp = "1472336466082")'

Contacts.register('0', 'HOME', '1472336466082')

if (Contacts::CONTACTS['1']['visited']['HOME'] && Contacts::CONTACTS['1'])
    puts 'Woohoo! Test 2 Passed'
else
    puts 'Something went wrong'
    puts 'CONTACTS hash  is:'
    puts Contacts::CONTACTS
    puts 'Aborting.'
    exit(1)
end

puts '3) After identifying a previously existing visitor her e-mail and name should be set'

puts 'Identifying visitor with id 1 (id = "1", email = "graceh@navy.us", name = "Grace")'

Contacts.identify('1', 'graceh@navy.us', 'Grace Hopper')

if (Contacts::CONTACTS['1']['email'] == 'graceh@navy.us' && Contacts::CONTACTS['1']['name'] == 'Grace Hopper')
    puts '3 for 3! All tests passed! Done.'
else
    puts 'Something is not right'
    puts 'CONTACTS hash  is:'
    puts Contacts::CONTACTS
    puts 'Aborting.'
    exit(1)
end
