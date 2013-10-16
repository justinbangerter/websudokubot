class Page
  def initialize(browser, url)
    @browser = browser
    @URL = url
  end

  def open(append='')
    @browser.goto @URL+append
  end
end
