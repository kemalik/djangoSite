from lettuce import before, after, world
from selenium import webdriver


@before.harvest
def prepare_browser_driver(variables):
    world.browser = webdriver.Firefox()


'''@after.harvest
def destroy_browser(results):
    world.browser.close()'''