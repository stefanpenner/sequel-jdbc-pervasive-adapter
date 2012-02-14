require 'sequel/jdbc_pervasive_adapter'

DB_STRING = ENV['PERVASIVE_DB']

db = Sequel.connect(DB_STRING)
class Item < Sequel::Model(db[:item])
end

describe 'pervasive' do

  it 'fails to connect to non existent database' do
    expect {
      Sequel.connect("jdbc:pervasive://nowhere/nada").tables
    }.to raise_error(Sequel::DatabaseConnectionError)
  end

  context "with test database" do
    subject do
      Sequel.connect(DB_STRING)
    end

    its(:database_type) { should equal(:pervasive) }
    its(:tables)        { should include(:item) }

    context "ORM" do
      subject { Item }
      its(:first) { should_not be_nil }
      it "limits" do
        subject.limit(1).all.count.should == 1
      end

      it "all" do
        # quick test, fast hack for now
        subject.unlimited.sql =~ /^SELECT \* FROM \"item\"/
      end
    end
  end
end
