from lettuce import *
from lettuce.django import django_url
from selenium.webdriver.common.keys import Keys

@step(r'access to page "(.*)"')
def access_to_page(step, page):
    world.browser.get(django_url(page))

@step(r'see the title "(.*)"')
def see_title(step, title):
    assert world.browser.title == title

@step(r'click on the button by css "(.*)"')
def click_on_the_button(step, name):
	elem = world.browser.find_element_by_css_selector(name)
	elem.send_keys(Keys.ENTER)

@step(r'should see text "(.*)" by id "(.*)"')
def should_see(step, text, byid):
	elem = world.browser.find_element_by_id(byid)
	assert text in elem.text, elem.text