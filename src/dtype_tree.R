dtype_tree <- setClass("dtype_tree",
         contains = list("dtype_node"))

setValidity("dtype_tree",
            function(object){
                    if(class(object)[1] != "dtype_node") return("Tree must be of type dtype_node")
                    #this should be a has_property method
                    if(!"children" %in% names(get_properties(object))) return("Node must have children")
                    TRUE
            }
)