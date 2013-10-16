require_relative 'index'
class Site

  def home
    @home = Index.new(@browser)
  end

  def close
    @browser.close
  end

  def open
    @browser = Watir::Browser.new BROWSER_TYPE
  end

end
