from lettuce import *
from lettuce.django import django_url


@step(r'do not see the text "(.*)"')
def do_not_see_the_text(step, text):
    assert text not in world.browser.page_source, "Text %sin this page" % text