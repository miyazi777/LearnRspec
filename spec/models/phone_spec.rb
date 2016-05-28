#require 'rails_helper'

describe Phone do
  # 連絡先ごとに重複した電話番号を許可しないこと
  it "does not allow duplicate phone numbers per contact" do
    contact = create(:contact)
    create(:home_phone,
           contact: contact,
           phone: '785-555-1234'
          )
    mobile_phone = build(:mobile_phone,
                         contact: contact,
                         phone: '785-555-1234'
                        )
    mobile_phone.valid?
    expect(mobile_phone.errors[:phone]).to include('has already been taken')
    #contact = Contact.create(
    #  firstname: 'Joe',
    #  lastname: 'Tester',
    #  email: 'joetester@example.com'
    #)
    #contact.phones.create(
    #  phone_type: 'home',
    #  phone: '785-555-1234'
    #)
    #mobile_phone = contact.phones.build(
    #  phone_type: 'mobile',
    #  phone: '785-555-1234'
    #)
    #mobile_phone.valid?
    #expect(mobile_phone.errors[:phone]).to include('has already been taken')
  end

  # ２件の連絡先で同じ電話番号を共有できること
  it "allows two contacts to share a phone number" do
    create(:home_phone,
       phone: "785-555-1234")
    expect(build(:home_phone,
       phone: "785-555-1234")).to be_valid
    #contact = Contact.create(
    #  firstname: 'Joe',
    #  lastname: 'Tester',
    #  email: 'joetester@example.com'
    #)
    #contact.phones.create(
    #  phone_type: 'home',
    #  phone: '785-555-1234'
    #)
    #other_contact = Contact.new
    #other_phone = other_contact.phones.build(
    #  phone_type: 'home',
    #  phone: '785-555-1234'
    #)
    #expect(other_phone).to be_valid
  end


end
