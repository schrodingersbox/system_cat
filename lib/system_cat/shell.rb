module SystemCat
  class Shell

    def self.run(command, force: false, test: false)
      puts '_______________________________________________________________________________'
      puts command

      return if test

      result = `#{command}`
      puts result
      raise 'Command failed' unless exitstatus.zero? || force

      return result
    end

    def self.exitstatus
      $?.exitstatus
    end
  end
end
