require 'spec_helper'

describe Category do
  it { should have_many(:sub_categories)}
end
