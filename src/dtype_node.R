dtype_node <- setClass("dtype_node",
                       slots = c(id = "numeric",
                                 properties = "list")
                       )

# setMethod("initialize",
#           signature(object = "dtype_node",id = "numeric",...),
#           function(object,id, ...){
#               object <- callNextMethod()
#           }
#           )

setGeneric("get_id", function(object, ...) standardGeneric("get_id"))
setMethod("get_id",
          signature(object = "dtype_node"),
          function(object) object@id
          )

setGeneric("get_properties", function(object, ...) standardGeneric("get_properties"))
setMethod("get_properties",
          signature(object = "dtype_node"),
          function(object) object@properties
          )

setGeneric("get_property", function(object, property_name, ...) standardGeneric("get_property"))
setMethod("get_property",
          signature(object = "dtype_node", property_name = "character"),
          function(object, property_name){
              properties_list <- object@properties
              property <- getElement(properties_list, property_name)
          }
          )