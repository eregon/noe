module Noe
  module Version

    MAJOR = 1
    MINOR = 7
    TINY  = 2

    def self.to_s
      [ MAJOR, MINOR, TINY ].join('.')
    end

  end
  VERSION = Version.to_s
end
