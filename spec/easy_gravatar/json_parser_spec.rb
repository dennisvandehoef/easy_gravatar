require 'spec_helper'

describe EasyGravatar::JsonParser do
  before(:each) do
    j = '{"entry":[{"id":"67473678","hash":"274096d1a68cf5740240b6ffb789c5c7","requestHash":"18d25970791c7cfaa521824b83600570","profileUrl":"http:\/\/gravatar.com\/dvdhoef88","preferredUsername":"dvdhoef88","thumbnailUrl":"https:\/\/secure.gravatar.com\/avatar\/274096d1a68cf5740240b6ffb789c5c7","photos":[{"value":"https:\/\/secure.gravatar.com\/avatar\/274096d1a68cf5740240b6ffb789c5c7","type":"thumbnail"},{"value":"https:\/\/secure.gravatar.com\/userimage\/67473678\/7c60b54ff484fcb807e82d77dd28563f"},{"value":"https:\/\/secure.gravatar.com\/userimage\/67473678\/d00f82088e7833d44208731f999d5246"}],"profileBackground":{"color":"#82cef7"},"name":{"givenName":"Dennis","familyName":"van de Hoef","formatted":"Dennis van de Hoef"},"displayName":"dvdhoef88","aboutMe":"A dutch man living in Berlin","currentLocation":"Berlin","phoneNumbers":[{"type":"home","value":"0123456789"},{"type":"work","value":"9876543210"},{"type":"mobile","value":"0147258369"}],"emails":[{"primary":"true","value":"foo@bar.com"}],"ims":[{"type":"aim","value":"fakeAim"},{"type":"yahoo","value":"FakeYahoo"},{"type":"icq","value":"fakeICQ"},{"type":"gtalk","value":"fakeGtalk"},{"type":"skype","value":"fakeSkype"}],"accounts":[{"domain":"facebook.com","display":"View Profile","url":"http:\/\/www.facebook.com\/100001859633067","username":"100001859633067","verified":"true","shortname":"facebook"},{"domain":"linkedin.com","display":"dvdhoef","url":"https:\/\/www.linkedin.com\/in\/dvdhoef","username":"dvdhoef","verified":"true","shortname":"linkedin"},{"domain":"twitter.com","display":"@DvdHoef88","url":"http:\/\/twitter.com\/DvdHoef88","username":"DvdHoef88","verified":"true","shortname":"twitter"}],"currency":[{"type":"bitcoin","value":"1G1bt7njtJCpRk4DmcPAHBWLhhH76ShWPA"},{"type":"litecoin","value":"LMyHoWmMZDDeUCRDvTruteTyqngNy1Df6v"},{"type":"dogecoin","value":"DEuSKr6w9D4Esh6gkp5RPbS3kpWBxTU1bY"}],"urls":[{"value":"http:\/\/www.hoefweb.nl","title":"Hoefweb.nl"},{"value":"http:\/\/github.com\/dennisvandehoef","title":"Profile on github"}]}]}'
    @parsed = EasyGravatar::JsonParser.for(j).parse
  end

  it 'removes the first layers' do
    expect(@parsed[:id]).to eq('67473678')
    expect(@parsed[:hash]).to eq('274096d1a68cf5740240b6ffb789c5c7')
    expect(@parsed[:requestHash]).to eq('18d25970791c7cfaa521824b83600570')
    expect(@parsed[:profileUrl]).to eq('http://gravatar.com/dvdhoef88')
    expect(@parsed[:preferredUsername]).to eq('dvdhoef88')
    expect(@parsed[:thumbnailUrl]).to eq('https://secure.gravatar.com/avatar/274096d1a68cf5740240b6ffb789c5c7')
    expect(@parsed[:displayName]).to eq('dvdhoef88')
    expect(@parsed[:aboutMe]).to eq('A dutch man living in Berlin')
    expect(@parsed[:currentLocation]).to eq('Berlin')
  end

  it 'adds name data to the first layer' do
    expect(@parsed[:givenName]).to eq('Dennis')
    expect(@parsed[:familyName]).to eq('van de Hoef')
    expect(@parsed[:formattedName]).to eq('Dennis van de Hoef')
  end

  it 'adds the backgroundColor to the first layer' do
    expect(@parsed[:profileBackgroundColor]).to eq('#82cef7')
  end

  it 'reorganises the phone numbers' do
    expect(@parsed[:phoneNumbers][:home]).to eq('0123456789')
    expect(@parsed[:phoneNumbers][:work]).to eq('9876543210')
    expect(@parsed[:phoneNumbers][:mobile]).to eq('0147258369')
  end

  it 'reorganises the ims' do
    expect(@parsed[:ims][:aim]).to eq('fakeAim')
    expect(@parsed[:ims][:yahoo]).to eq('FakeYahoo')
    expect(@parsed[:ims][:icq]).to eq('fakeICQ')
    expect(@parsed[:ims][:gtalk]).to eq('fakeGtalk')
    expect(@parsed[:ims][:skype]).to eq('fakeSkype')
  end

  it 'parses the email adresses to an array' do
    expect(@parsed[:email][0]).to eq('foo@bar.com')
  end

  it 'reorganises the currencies' do
    expect(@parsed[:currency][:bitcoin]).to eq('1G1bt7njtJCpRk4DmcPAHBWLhhH76ShWPA')
    expect(@parsed[:currency][:litecoin]).to eq('LMyHoWmMZDDeUCRDvTruteTyqngNy1Df6v')
    expect(@parsed[:currency][:dogecoin]).to eq('DEuSKr6w9D4Esh6gkp5RPbS3kpWBxTU1bY')
  end
end
