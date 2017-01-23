require "pry"

class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@next_id = 1000

  # Call the initializer, store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = self.new(first_name,last_name, email, note)
    @@contacts << new_contact
    new_contact
  end

  # Return all of the existing contacts
  def self.all
    @@contacts
  end

  # Accept an id as an argument and return the contact who has that id
  def self.find(search_id)
    @@contacts.each do |contact|
      return contact if contact.id == search_id
    end
  end

  # Search for a contact using attributes other than id
  def self.find_by(variable, value)
    @@contacts.each do |contact|
      return contact if contact.send(variable) == value
    end
  end

  # Delete all of the contacts
  def self.delete_all
    # puts "WARNING: This will delete all of your contacts permanently. This action cannot be undone. Type 'delete' to confirm this action."
    # response = gets.chomp
    # if response == "delete"
      @@contacts = []
    #   puts "Your contact list is now empty."
    # else
    #   puts "Your contacts have not been deleted."
    # end
  end


  # Initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@next_id
    @@next_id += 1
  end

  # Get contact's full name
  def full_name
    full_name = "#{first_name} #{last_name}"
  end

  # Get the contact's attribute you want to update
  # and the new value for that attribute
  # and then make the appropriate change to the contact
  def update(variable, new_value)
    self.send("#{variable}=", new_value)
  end

  # Delete the contact
  def delete
    @@contacts.delete(self)
  end

  # Return details of one contact
  def details
      contact_details = {"Full Name" => full_name, "Email" => email, "Note" => note}
  end

end


# TEST
jose = Contact.create("Jose", "Bautista", "joeybats19@fake.email", "Flippin' bats for your playoff enjoyment!")
edwin = Contact.create("Edwin", "Encarnacion", "edwin@fake.email", "Walking the parrot...in Cleveland. So sad. :\(")
pillar = Contact.create("Kevin", "Pillar", "kevin.pillar@fake.email", "Catch all the things!")

# puts jose.details
