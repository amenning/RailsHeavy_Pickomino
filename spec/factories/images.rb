FactoryGirl.define do
  factory :image do
    id 1
    target 'test target'
    filename 'test filename'
    filetype 'test filetype'
    description 'test description'
    theme
  end
end
