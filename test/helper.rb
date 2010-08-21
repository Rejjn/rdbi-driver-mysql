require 'rubygems'
gem 'test-unit'
require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rdbi/driver/mysql'
gem 'rdbi-dbrc'
require 'rdbi-dbrc'

class Test::Unit::TestCase

  attr_accessor :dbh

  def connect
    RDBI::DBRC.connect(:mysql_test)
  end

  def role
    RDBI::DBRC.roles[:mysql_test]
  end

  def setup
    self.dbh = connect
  end

  def teardown
    dbh.disconnect if dbh and dbh.connected?
  end
end
