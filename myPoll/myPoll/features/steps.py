from lettuce import *
from lettuce.django import django_url
from selenium.webdriver.common.keys import Keys


@step(r'access to page "(.*)"')
def access_to_page(step, page):
    world.browser.get(django_url(page))


@step(r'see the title "(.*)"')
def see_title(step, title):
    assert world.browser.title == title


@step(r'see the element by css-path "(.*)"')
def see_the_submit_button(step, css_path):
    element = world.browser.find_element_by_css_selector(css_path)
    assert element, 'no element found by css-selector %s' % css_path


@step(r'see the form field "(.*)"')
def see_the_form_field(step, field_name):
    form_field = world.browser.find_element_by_name(field_name)
    assert form_field, 'no form field named %s were found' % field_name


@step(r'see the log in form')
def see_the_login_form(step):
    login = step.given(r'see the form field "username"')
    password = step.given(r'see the form field "password"')
    submit_button = step.given('see the element by css-path ".submit-row input"')
    assert login and password and submit_button, 'This is no log in form'


@step(r'click on the button by css-selector "(.*)"')
def click_on_the_button(step, name):
    element = world.browser.find_element_by_css_selector(name)
    element.send_keys(Keys.ENTER)


@step(r'see the text "(.*)" by id "(.*)"')
def see_the_text(step, text, byid):
    element = world.browser.find_element_by_id(byid)
    assert text in element.text, element.text


@step(r'fill the field named "(.*)" with value "(.*)"')
def fill_the_field_named(step, name, value):
    field = world.browser.find_element_by_name(name)
    field.send_keys(value)


@step(r'click on the link "(.*)"')
def click_on_the_link(step, name):
    link = world.browser.find_element_by_link_text(name)
    link.send_keys(Keys.ENTER)