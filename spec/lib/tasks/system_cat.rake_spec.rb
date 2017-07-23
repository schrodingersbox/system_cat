require 'rake'

describe 'rake system_cat tasks' do

  before(:each) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake::Task.define_task(:environment)
    load 'lib/tasks/system_cat.rake'
  end

  describe 'rake system_cat:dummy' do

    it 'exists' do
      @rake['system_cat:dummy'].invoke
    end
  end
end
