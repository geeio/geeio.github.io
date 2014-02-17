class HirePage
  data: ->
    name: 'George'
    email: 'me+test@gee.io'
    what: 'stuff'
    phone: '19046543025'
    budget: '1000'

  get: ->
    browser.get "/hire"

  set_field: (model, value) ->
    element(bi.model(model)).sendKeys(value)

  set_form: (data, prefix = 'data') ->
    data = data || @data()
    for own field, value of data
      @set_field("#{prefix}.#{field}", value)

  set_form_missing: (field) ->
    data = @data()
    delete data[field]
    @set_form(data)

  submit: ->
    element(bi.css('button')).click()

describe "angularjs homepage", ->
  page = new HirePage
  beforeEach ->
    page.get()

  # it 'has the correct header', ->
  #   heading = element(bi.css(".page-title"))
  #   expect(heading.getText()).toEqual "HIRE GEE.IO"

  # ['name', 'email', 'what', 'phone', 'budget'].forEach (field) ->
  #   it "requires #{field}", ->
  #     page.set_form_missing(field)
  #     page.submit()

  #     error_block = element(bi.css("[field=#{field}] .error-block"))
  #     expect(error_block.isDisplayed()).toBe true

  it 'sends an email to me+test@gee.io', ->
    page.set_form()
    page.submit()
    browser.sleep(3000)

