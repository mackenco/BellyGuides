require 'spec_helper'

describe Favorite do

  it { should belong_to(:map) }
  it { should belong_to(:user) }

end