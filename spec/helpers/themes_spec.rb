require 'rails_helper'
RSpec.describe Helpers::Themes, type: :Helper do
  fixtures :themes

  context 'when called, it should return the theme' do
    before(:each) do
      @themes_helper = Helpers::Themes.new
    end

    it 'should return theme id 1' do
      theme_id = @themes_helper.theme.id
      expect(theme_id).to equal(1)
    end
  end
end
