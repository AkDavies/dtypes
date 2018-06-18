context("Tests for the implementation of a node data type")
source("../src/dtype_node.R")

test_that(desc = "Test that the slots of the node are accurately set (that they have the correct types and values).",
          simple_node <- dtype_node(id = 1),
          expect_equal(class(simple_node), c("dtype_node", "dtype")),
          expect_equal(get_id(simple_node), 1),
          expect_type(get_id(simple_node), "numeric"),
          expect_type(get_properties(simple_node), "list"))
