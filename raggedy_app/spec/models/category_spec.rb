require 'spec_helper'

describe Category do
  it { should have_many(:sub_categories)}
  it { should have_many(:products)}
  it { should have_many(:sizes)}
end

