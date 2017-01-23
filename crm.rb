require "pry"
require_relative "contact"

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "MAIN MENU"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Search by attribute"
    puts "[6] Exit"
    print "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    # when 6 then ...figure out
    else
      puts "Invalid selection."
    end
  end

  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp

    print "Enter Last Name: "
    last_name = gets.chomp

    print "Enter Email Address: "
    email = gets.chomp

    print "Enter a Note: "
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print "Enter contact ID number: "
    contact_id = gets.to_i
    contact_to_modify = Contact.find(contact_id)

    puts "You are modifying #{contact_to_modify.full_name}"

    print "Enter attribute to be changed: "
    attribute = gets.chomp

    print "Enter new value: "
    new_value = gets.chomp

    contact_to_modify.update(attribute, new_value)
  end

  def delete_contact

  end

  def display_all_contacts
    Contact.all.each do |contact|
      puts "#{contact.id}: #{contact.full_name}, #{contact.email}, #{contact.note}"
    end
  end

  def search_by_attribute

  end


end

book = CRM.new
book.main_menu
