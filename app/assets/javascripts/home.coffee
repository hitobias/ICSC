# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# $(document).ready ->
# 	
$(document).on 'ready page:load', ->
	# alert "sadfasdfs"
	# $('.arrived_attributes').hide()

activeTab(tab) ->
	$('.nav-tabs a[href="#' + tab + '"]').tab('show')


