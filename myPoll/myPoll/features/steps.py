from lettuce import *
from lettuce.django import django_url
from selenium.webdriver.common.keys import Keys


@step(r'access to page "(.*)"')
def access_to_page(step, page):
    world.browser.get(django_url(page))


@step(r'see the title "(.*)"')
def see_title(step, title):
    assert world.browser.title == title


@step(r'click on the button by css-selector "(.*)"')
def click_on_the_button(step, name):
    element = world.browser.find_element_by_css_selector(name)
    element.send_keys(Keys.ENTER)


@step(r'see the text "(.*)" by id "(.*)"')
def see_the_text(step, text, byid):
    element = world.browser.find_element_by_id(byid)
    assert text in element.text, element.text

@step(r'fill the field named "(.*)" with "(.*)"')
def fill_the_field_named(step, name, username):
	field = world.browser.find_element_by_name(name)
	field.send_keys(username)

@step(r'click on the link "(.*)"')
def click_on_the_link(step, name):
	link = world.browser.find_element_by_link_text(name)
	link.send_keys(Keys.ENTER)