testthat::test_that("WindowsPath() coverts a Windows path to standard format", {
  # Double slashes to escape
  path <- "C:\\Repositories\\kevtools\\tests\\testthat\\test-WindowsPath.R"

  actual <- WindowsPath(
    path = "C:\\Repos\\kevtools\\tests\\testthat\\test-WindowsPath.R"
  )

  expected <- fs::as_fs_path("C:/Repos/kevtools/tests/testthat/test-WindowsPath.R")

  testthat::expect_equal(actual, expected = expected)
})
