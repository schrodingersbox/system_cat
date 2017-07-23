module SystemCat
  class Shell

    def self.run(command, force: false, test: false)
      puts '_______________________________________________________________________________'
      puts command

      unless test
        result = `#{command}`
        puts result
      end

      raise 'Command failed' unless exitstatus.zero? || force

      return result
    end

    def self.exitstatus
      $CHILD_STATUS.exitstatus
    end
  end
end
