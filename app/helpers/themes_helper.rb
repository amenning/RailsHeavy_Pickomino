module ThemesHelper
  def self.get_theme
    Theme.find(1)
  end
end
