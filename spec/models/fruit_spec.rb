require 'rails_helper'

RSpec.describe Fruit, elasticsearch: true, type: :model do
  it 'should be indexed' do
    # create an instance of your model
    Fruit.create(name: 'apple')

    # refresh the index 
    Fruit.__elasticsearch__.refresh_index! 

    # verify your model was indexed
    expect(Fruit.search('apple').records.length).to eq(1)
  end
end
