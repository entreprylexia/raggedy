require 'spec_helper'

describe Size do
  it { should have_many(:sub_sizes)}
  it { should have_many(:products)}
end
