context("Tests for the implementation of a node data type")
source("../src/dtype_node.R")

test_that(desc = "Test for the dtype_node constructor.",
          simple_node <- dtype_node(id = 1),
          expect_false(list(a = "A", b = "B") %>% type(), c("dtype_node", "dtype")), 
          expect_equal(class(simple_node), c("dtype_node", "dtype")),
          expect_error(non_numeric_id_node <- dtype_node(id = "Apples"),
                       info = "The dtype_node constructor requires the argument for the node id to be a numeric type"),
          expect_error(null_id_node <- dtype_node(id = NULL),
                       info = "The dtype_node constructor requires the argument for the node id to be a numeric type"),
          expect_equal(get_id(tenth_node),10),
          apple_node <- dtype_node(id = 1,
                                   properties = list(property_names = c("name"),
                                                     values = c("apple"))),
          expect_equal(get_property(apple_node,"name"), "apple"))

test_that(desc = "Tests for get_id",
          third_node <- dtype_node(id = 3),
          expect_type(get_id(third_node), "numeric"),
          expect_equal(get_id(third_node), 3)
          )

test_that(desc = "Tests for get_properties",
          tenth_node <- dtype_node(id = 10),
          expect_type(get_properties(tenth_node), "list"),
          expect_is(get_properties(tenth_node),NULL),
          shiny_bannana_bunch <- dtype_node(id = 1,
                                      properties = sbb_properties <- list(property_names = c("name",
                                                          "color",
                                                          "shape",
                                                          "number"),
                                                        values = c("yellow",
                                                                   "curved",
                                                                   "six")
                                                        )
                                      ),
          expect_equal(get_properties(shiny_banana_bunch), sbb_properties)
          )



