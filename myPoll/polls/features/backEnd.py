from lettuce import *


@step(r'see the link "(.*)"')
def see_the_link(step, name):
    link = world.browser.find_element_by_link_text(name)
    assert link, 'Not found link named %s' % name


@step(r'click on the links')
def click_on_the_links(step):
    for data in step.hashes:
        link = world.browser.find_element_by_link_text(data['name'])
        link.click()
        assert link, 'Link named %s were no found' % data['name']


@step(r'click element by name "(.*)"')
def click__element_by_name(step, name):
    element = world.browser.find_element_by_name(name)
    element.click()
    assert element, 'Element named %s were no found' % name


@step(r'see the text "(.*)" by css-path "(.*)"')
def see_the_submit_button(step, text, css_path):
    element = world.browser.find_element_by_css_selector(css_path)
    assert text in element.text, 'Text no found in element %s by css-selector %s' % css_path


@step(r'add poll "(.*)"')
def add_poll(step, text):
    step.behave_as('''
        And I click on the links:
            | name  |
            | Polls |
            | Add   |
            | Show  |
            | Today |
            | Now   |
        And fill the form:
			| name                     | value      |
			| question                 | {question} |
			| choice_set-0-choice_text | first      |
			| choice_set-1-choice_text | second     |
		And I click element by name "_save"
		Then I see the text "The poll "{question}" was added successfully" by css-path ".success"
    '''.format(question=text))