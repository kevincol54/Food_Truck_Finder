require 'rails_helper'

RSpec.describe Company, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:company) { Company.new(name: 'kickin chicken') }

  subject { company }

  context 'validations' do
    let(:company) { Company.new }

    it { should_not be_valid }
  end
end
