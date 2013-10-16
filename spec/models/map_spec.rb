require 'spec_helper'

describe Map do

  it { should belong_to(:owner) }
  it { should have_many(:restaurants) }
  it { should have_many(:comments) }
  it { should have_many(:favorites) }
  it { should have_many(:favorited_users) }

end