#
# A basic function to retrieve data in couchdb
#

#hostname  = ARGV[0]

#conn = Mysql.new('localhost', 'root', 'sp0lt0', 'cloudyo')
#rs = conn.query('select * from workers where hostname = \''+hostname+'\'')
#rs.each_hash { |h| puts h['url']}
#conn.close


module Puppet::Parser::Functions
  newfunction(:mysqldblookup, :type => :rvalue) do |args|
    require 'mysql'
    debug 'dio'
    hostname = args[0]
    conn = Mysql.new('localhost', 'root', 'sp0lt0', 'cloudyo')
    rs = conn.query('select * from workers where hostname = \''+hostname+'\' limit 1 ')
    data =  rs.fetch_hash()
    conn.close
    data['url'].to_s 
  end
end
