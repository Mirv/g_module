RSpec.configure do |rspec|
  # default in rspec 4, but 3 needs setting
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context "shared stuff", :shared_context => :metadata do
  before { @some_var = :some_value }
  def shared_method
    "it works"
  end
  let(:shared_let) { {'arbitrary' => 'object'} }
  subject do
    'this is the subject'
  end
end

RSpec.configure do |rspec|
  rspec.include_context "shared stuff", :include_shared => true
end