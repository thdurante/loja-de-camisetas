module ApplicationHelper
	def flash_message
	    messages = ""
	    [:success, :info, :warning, :danger].each {|type|
	      if flash[type]
	        messages += "<div class=\"alert alert-#{type} alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><i class=\"icon fa fa-info\"></i> #{flash[type]}</div>"
	      end
	    }
	    messages
 	 end
end
