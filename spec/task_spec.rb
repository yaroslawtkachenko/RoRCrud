require 'rails_helper'

RSpec.describe Task, type: :model do

  it { should belong_to(:user) }
  it { should validate_length_of(:name)}
  it { should validate_length_of(:description)}
end
