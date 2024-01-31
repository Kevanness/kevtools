testthat::test_that("WithoutNamespace_linter() doesn't flag namespace functions", {
  testthat::expect_no_error(
    lintr::lint(
      text = "purrr::map()",
      linters = WithoutNamespace_linter()
    )
  )
})
