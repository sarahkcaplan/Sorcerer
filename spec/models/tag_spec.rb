require 'rails_helper'

describe Tag do
  let(:tag) { Tag.new(name: "Ruby", permission: true) }

  it "has a name" do
    tag.save
    expect(Tag.last.name).to eq "Ruby"
  end

  it "has permission" do
    tag.save
    expect(Tag.last.permission).to eq true
  end

  it "has many resources" do
    user = User.create(first_name: "John", last_name: "Doe", email: "johnd@gmail.com", user_type: "student", password: "password")
    resource1 = Resource.create(title: "How to rails", url:'http://guides.rubyonrails.org/', author_id: user.id )
    resource2 = Resource.create(title: "Another one about rails", url:'http://guides.rubyonrails.org/', author_id: user.id )

    tag.resources << resource1
    tag.resources << resource2

    expect(tag.resources).to include(resource1, resource2)
  end
end
