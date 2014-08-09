from lettuce import *
from selenium.webdriver.common.keys import Keys


@step(r'see the link "(.*)"')
def see_the_link(step, name):
    link = world.browser.find_element_by_link_text(name)
    assert link, 'Not found link named %s' % name


@step(r'click on the link "(.*)"')
def click_on_the_link(step, name):
    link = world.browser.find_element_by_link_text(name)
    link.click()
    assert link, 'Link named %s were no found' % name



@step(r'click element by name "(.*)"')
def click__element_by_name(step, name):
    element = world.browser.find_element_by_name(name)
    element.click()
    assert element, 'Element named %s were no found' % name

@step(r'see the text "(.*)" by css-path "(.*)"')
def see_the_submit_button(step, text, css_path):
    element = world.browser.find_element_by_css_selector(css_path)
    assert text in element.text, 'Text no found in element %s by css-selector %s' % css_path