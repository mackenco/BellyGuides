require 'spec_helper'

describe User do

  it { should have_many(:maps) }
  it { should have_many(:restaurants) }
  it { should have_many(:comments) }
  it { should have_many(:favorites) }
  it { should have_many(:favorited_maps) }

end