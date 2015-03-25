# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	activeTab('aaa')
	alert "dfasdf"

activeTab(tab) ->
	$('.nav-tabs a[href="#' + tab + '"]').tab('show')

