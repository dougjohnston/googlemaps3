GoogleMaps3
==============

A wrapper for version 3 of the Google Maps API.

Install
-------

script/plugin install git://github.com/dougjohnston/googlemaps3.git

Usage
=====

Controller
----------
To create a basic map, use the following line in one of your controller actions:
@map = GoogleMap3::Map.new()

View
----
To include the necessary JavaScript, place the following line in the HEAD:
<%= @map.include_js if @map %>

To draw the map, place the following line in the BODY:
<%= @map.display %>

More to come...including tests...

Copyright (c) 2010 Doug Johnston, released under the MIT license
