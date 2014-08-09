from lettuce import before, after, world
from selenium import webdriver


@before.each_scenario
def prepare_browser_driver(variables):
    world.browser = webdriver.Firefox()


@after.each_scenario
def destroy_browser(results):
    world.browser.close()


'''@after.harvest
def destroy_browser(results):
    world.browser.close()'''