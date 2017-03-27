require 'rails_helper'
RSpec.describe Helpers::Themes, type: :Helper do
  context 'when called, it should return the theme' do
    before(:each) do
      @theme = create(:theme, id: 1)
      @themes_helper = Helpers::Themes.new
    end

    it 'should return theme id 1' do
      theme_id = @themes_helper.theme.id
      expect(theme_id).to equal(@theme.id)
    end
  end
end
