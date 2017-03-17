module ThemesHelper
  def self.theme
    Theme.find(1)
  end
end
