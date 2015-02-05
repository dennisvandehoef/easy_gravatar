require 'spec_helper'

describe EasyGravatar::JsonParser do
  before(:each) do
    j = '{"entry":[{"id":"67473678","hash":"274096d1a68cf5740240b6ffb789c5c7","requestHash":"dvdhoef88","profileUrl":"http:\/\/gravatar.com\/dvdhoef88","preferredUsername":"dvdhoef88","thumbnailUrl":"http:\/\/1.gravatar.com\/avatar\/274096d1a68cf5740240b6ffb789c5c7","photos":[{"value":"http:\/\/1.gravatar.com\/avatar\/274096d1a68cf5740240b6ffb789c5c7","type":"thumbnail"},{"value":"http:\/\/0.gravatar.com\/userimage\/67473678\/7c60b54ff484fcb807e82d77dd28563f"},{"value":"http:\/\/0.gravatar.com\/userimage\/67473678\/d00f82088e7833d44208731f999d5246"}],"profileBackground":{"color":"#82cef7"},"name":{"givenName":"Dennis","familyName":"van de Hoef","formatted":"Dennis van de Hoef"},"displayName":"dvdhoef88","aboutMe":"A dutch man living in Berlin","currentLocation":"Berlin","emails":[{"primary":"true","value":"foo@bar.com"}],"ims":[{"type":"skype","value":"foobar"}],"accounts":[{"domain":"facebook.com","display":"View Profile","url":"http:\/\/www.facebook.com\/100001859633067","username":"100001859633067","verified":"true","shortname":"facebook"},{"domain":"linkedin.com","display":"dvdhoef","url":"https:\/\/www.linkedin.com\/in\/dvdhoef","username":"dvdhoef","verified":"true","shortname":"linkedin"},{"domain":"twitter.com","display":"@DvdHoef88","url":"http:\/\/twitter.com\/DvdHoef88","username":"DvdHoef88","verified":"true","shortname":"twitter"}],"currency":[{"type":"bitcoin","value":"14Z6yNjuqnTRevmqe5jHiNYFWfvsRaFBGm"},{"type":"litecoin","value":"LgzvJPZEiZynEs2JFdoqRSwgMELVmRpvb8"},{"type":"dogecoin","value":"DEE13B32ZHfWu4EYuZUHYRdVF3DXi42ECg"}],"urls":[{"value":"http:\/\/www.hoefweb.nl","title":"Hoefweb.nl"},{"value":"http:\/\/github.com\/dennisvandehoef","title":"Profile on github"}]}]}'
    @parsed = EasyGravatar::JsonParser.new(j).parse
  end

  it 'returns a Hash' do
    expect(@parsed.class).to .eq(Hash)
  end

  it 'removes the first layers' do
    expect(@parsed[:id]).to eq('67473678')
  end

  it 'adds name data to the first layer' do
    expect(@parsed[:givenName]).to eq('Dennis')
    expect(@parsed[:familyName]).to eq('van de Hoef')
    expect(@parsed[:formattedName]).to eq('Dennis van de Hoef')
  end

  it 'adds the backgroundColor to the first layer' do
    expect(@parsed[:profileBackgroundColor]).to eq('#82cef7')
  end

  it 'reorganises the currencies' do
    expect(@parsed[:currency][:bitcoin]).to eq('14Z6yNjuqnTRevmqe5jHiNYFWfvsRaFBGm')
    expect(@parsed[:currency][:litecoin]).to eq('LgzvJPZEiZynEs2JFdoqRSwgMELVmRpvb8')
    expect(@parsed[:currency][:dogecoin]).to eq('DEE13B32ZHfWu4EYuZUHYRdVF3DXi42ECg')
  end
end
