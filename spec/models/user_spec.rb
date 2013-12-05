require 'spec_helper'

describe User do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:mail) }
  it { should validate_presence_of(:password) }

end
