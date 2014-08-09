from lettuce import *
from lettuce.django import django_url
from selenium.webdriver.common.keys import Keys

@step(r'see the password form')
def see_the_password_form(step):
	old = step.given(r'see the form field "old_password"')
	new1 = step.given(r'see the form field "new_password1"')
	new2 = step.given(r'see the form field "new_password2"')
	submit_button = step.given('see the element by css-path ".submit-row input"')
	assert old and new1 and new1 and submit_button, "This is not passord frm"


@step(r'open password change page')
def open_password_change_page(step):
	log_in = step.given('log in')
	pass_change_page = step.given('click on the link "Change password"')
	assert log_in and pass_change_page, 'can not open pass change page'