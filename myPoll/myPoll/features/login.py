# -*- coding: utf-8 -*-

from lettuce import *
from lettuce.django import django_url


@step(u'получил доступ к странице "(.*)"')
def access_to_page(step, page):
    world.browser.get(django_url(page))


@step(u'вижу заголовок "(.*)"')
def see_title(step, title):
    assert world.browser.title == title


@step(u'вижу элемент по css-путям "(.*)"')
def see_the_submit_button(step, css_path):
    element = world.browser.find_element_by_css_selector(css_path)
    assert element, u'не найден элемент по css-путям %s' % css_path


@step(u'вижу поле ввода "(.*)"')
def see_the_form_field(step, field_name):
    form_field = world.browser.find_element_by_name(field_name)
    assert form_field, u'не найден элемент %s' % field_name


@step(u'вижу окно входа')
def see_the_login_form(step):
    login = step.given(u'вижу поле ввода "username"')
    password = step.given(u'вижу поле ввода "password"')
    submit_button = step.given(u'вижу элемент по css-путям ".submit-row input"')
    assert login and password and submit_button, u'Это не форма входа'


@step(u'заполнил форму')
def fill_the_form(step):
    for data in step.hashes:
        step.given(u'заполнил поле с именем "(.*)" с значением "(.*)"' % (data[u'name'], data[u'value']))


@step(u'нажимаю по элементу с css-селектором "(.*)"')
def click_on_the_button(step, name):
    element = world.browser.find_element_by_css_selector(name)
    element.click()


@step(u'вижу текст "(.*)" с id "(.*)"')
def see_the_text(step, text, byid):
    element = world.browser.find_element_by_id(byid)
    assert text in element.text, element.text


@step(u'заполнил поле с именем "(.*)" с значением "(.*)"')
def fill_the_field_named(step, name, value):
    field = world.browser.find_element_by_name(name)
    field.send_keys(value)


@step(u'нажимаю по ссылке "(.*)"')
def click_on_the_link(step, name):
    link = world.browser.find_element_by_link_text(name)
    link.click()


@step(u'заполнил форму')
def fill_the_form(step):
    for data in step.hashes:
        step.given(u'заполнил поле с именем "%s" с значением "%s"' % (data['name'], data['value']))


@step(u'вижу ссылки')
def see_the_links(step):
    for data in step.hashes:
        link = world.browser.find_element_by_link_text(data['name'])
        assert link, u'Ссылка с названием %s не был найден' % data['name']


@step(u'вошел')
def log_in(step):
    step.given(u'получил доступ к странице "/admin"')
    step.given(u'вижу окно входа')
    step.given(u'''заполнил форму:
			| name     | value |
			| username | malik |
			| password | pass  |''')
    step.given(u'нажимаю по элементу с css-селектором ".submit-row input"')
    step.given(u'вижу текст "malik" с id "user-tools"')