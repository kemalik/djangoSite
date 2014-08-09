from lettuce import *

@step(r'see the link "(.*)"')
def see_the_link(step, name):
    link = world.browser.find_element_by_link_text(name)
    assert link, 'Not found link named %s' % name