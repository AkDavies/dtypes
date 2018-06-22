dtype_unionfind <- setClass("dtype_unionfind",
                            slots = list(parents = "vector",
                                         node_sets = "list"))

setGeneric("union", function(object, id1, id2) standardGeneric("union"))
setMethod("union",
          signature(object = "dtype_unionfind",
                    id1 = "numeric",
                    id2 = "numeric"),
          function(object, id1, id2){
              node_sets <- object@node_sets
              group1 <- node_sets$id1
              group2 <- node_sets$id2
              other_sets <- node_sets[-c(group1,group2)]
              merged_group <- append(group1,group2)
              new_sets <- append(other_sets, merged_group)
              object@node_sets <- new_sets
              object
          }
)

