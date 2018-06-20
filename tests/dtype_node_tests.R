context("Tests for the implementation of a node data type")


test_that(desc = "Test for the dtype_node constructor.",
          {
              simple_node <- dtype_node(id = 1)
              expect_false(typeof(list(a = "A", b = "B")) == c("dtype_node"))
              expect_equal(class(simple_node)[1], c("dtype_node"))
              expect_error(non_numeric_id_node <- dtype_node(id = "Apples"),
                           info = "The dtype_node constructor requires the argument for the node id to be a numeric type")
              expect_error(null_id_node <- dtype_node(id = NULL),
                           info = "The dtype_node constructor requires the argument for the node id to be a numeric type")
          }
)

test_that(desc = "Tests for get_id",
          {
              third_node <- dtype_node(id = 3)
              expect_type(get_id(third_node), "double")
              expect_equal(get_id(third_node), 3)
              tenth_node <- dtype_node(id = 10)
              expect_equal(get_id(tenth_node),10)
          }
)

test_that(desc = "Tests for get_properties",
          {
              tenth_node <- dtype_node(id = 10)
              expect_type(get_properties(tenth_node), "list")
              expect_equal(length(get_properties(tenth_node)), 0)
              shiny_banana_bunch <- dtype_node(id = 1,
                                                properties = sbb_properties <- list(name = "banana",
                                                                                    color = "yellow",
                                                                                    shape = "curved",
                                                                                    number = 6
                                                                                )
                                    )
              expect_equal(get_properties(shiny_banana_bunch), sbb_properties)
          }
)

test_that(desc = "Tests for get_property",
          {
              apple_node <- dtype_node(id = 1,
                                       properties = list(name = "apple")
              )
              expect_equal(get_property(apple_node,"name"), "apple")
              shiny_banana_bunch <- dtype_node(id = 1,
                                                properties = sbb_properties <- list(name = "banana",
                                                                                    color = "yellow",
                                                                                    shape = "curved",
                                                                                    number = 6
                                                                                )
                                    )
              expect_equal(get_property(shiny_banana_bunch,"name"), "banana")
              expect_equal(get_property(shiny_banana_bunch,"color"), "yellow")
              expect_equal(get_property(shiny_banana_bunch,"shape"), "curved")
              expect_equal(get_property(shiny_banana_bunch,"number"), 6)
          }
)



