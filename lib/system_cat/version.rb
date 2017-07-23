module SystemCat
  class Version

    attr_accessor :code

    def initialize(path = 'config/version.txt')
      @path = path
      @code = File.read(@path).to_i
    end

    def decrement
      @code = code - 1
      return self
    end

    def increment
      @code = code + 1
      return self
    end

    def save
      File.open(@path, 'wb') { |io| io.write(@code) }
    end

    def to_s
      major = (code / 100).to_i
      minor = ((code % 100) / 10).to_i
      build = code % 10
      return "#{major}.#{minor}.#{build}"
    end

    def self.bump
      return Version.new.increment.save
    end
  end
end
