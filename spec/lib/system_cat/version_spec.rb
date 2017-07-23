require 'system_cat/version'

describe 'version' do

  it 'has a version constant' do
    expect(SystemCat::VERSION).to_not be_nil
    expect(SystemCat::VERSION).to be_an_instance_of(String)
    expect(SystemCat::VERSION).to match(/\d+\.\d+\.\d+/)
  end
end
