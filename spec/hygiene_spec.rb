describe 'hygiene' do

  it('passes rubocop') { is_expected.to pass_rubocop }

  it 'has a spec for every file' do
    Dir.glob(File.join('lib', '**', '*.{rb,rake}')) do |path|
      expect(path).to have_a_spec
    end
  end
end
