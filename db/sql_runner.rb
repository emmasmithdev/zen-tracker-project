require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'dc3ss1tqo0d9vo', host: '
          ec2-52-55-59-250.compute-1.amazonaws.com',
          port: 5432, user: 'zogyrqmvrrhoic', password: '421fcac1565a2ad8e2c2d725b60bbe15cc455ba316acf8e17cea0c28fc81abb4
' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
