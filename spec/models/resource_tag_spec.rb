require 'rails_helper'

describe ResourceTag do

  it "belongs to a resource" do
    user = User.create(first_name: "Sarah", last_name: "Caplan", email: "sarah@gmail.com", password: "1234", user_type: "Teacher")
    tag = Tag.create(name: "Ruby", permission: true)
    resource = Resource.create(title: "How to rails", url: "http://guides.rubyonrails.org/", author_id: user.id )
    resource_tag = ResourceTag.create(resource_id: resource.id, tag_id: tag.id)
    expect(resource_tag.resource).to eq(resource)
  end

  it "belongs to a tag" do
    user = User.create(first_name: "Sarah", last_name: "Caplan", email: "sarah@gmail.com", password: "1234", user_type: "Teacher")
    tag = Tag.create(name: "Ruby", permission: true)
    resource = Resource.create(title: "How to rails", url: "http://guides.rubyonrails.org/", author_id: user.id )
    resource_tag = ResourceTag.create(resource_id: resource.id, tag_id: tag.id)
    expect(resource_tag.tag).to eq(tag)
  end
end
