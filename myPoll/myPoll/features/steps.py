from lettuce import *
from lettuce.django import django_url

@step(r'access to page "(.*)"')
def access_to_page(step, page):
    world.browser.get(django_url(page))

@step(r'see the title "(.*)"')
def see_title(step, title):
    assert world.browser.title == title