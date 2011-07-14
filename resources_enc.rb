#!/usr/bin/env ruby
#
# Load the YAML library in ruby. Provide the to_yaml method for all 
# Ruby objects. 
require 'yaml'
# The output hash. Must contain the "parameters" and "classes" key. 
# See: http://docs.puppetlabs.com/guides/external_nodes.html 
@out = Hash.new
# Output Array of classes, Hash of Parameters 
@out["classes"]	= Array.new 
@out["parameters"] = Hash.new
# Add the motd_location class to the catalogs 
@out["classes"] << "motd_location" 
# Add a location parameter 
@out["parameters"]["enc_location"] = "Florida"
# Output the YAML node classification to standard output. 
puts @out.to_yaml 
# Must exit with a status of zero for classification to succeed. 
exit(0)
