require 'spec_helper'

describe EasyGravatar::Gravatar do

  before(:each) do
    @gravatar_user = EasyGravatar::Gravatar.new('foo@bar.com')
  end

  it 'can make a vallid md5 hash' do
    expect(@gravatar_user.md5).to eq('f3ada405ce890b6f8204094deb12d8a8')
  end

end
