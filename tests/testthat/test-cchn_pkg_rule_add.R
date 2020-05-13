email <- "sckott7@gmail.com"

test_that("cchn_pkg_rule_add", {
  skip_on_ci()

  vcr::use_cassette("cchn_pkg_rule_add", {
    x <- cchn_pkg_rule_add(status = "note", platform = 3,
      package = "foobar", email = email, quiet = TRUE)
    rules <- cchn_pkg_rule_list(email = email)
  })
  
  expect_true(x)

  dat <- rules$data
  fb <- dat[dat$package == "foobar", ]
  expect_equal(sort(names(fb)),
    c("id", "package", "rule_platforms", "rule_regex",
      "rule_status", "rule_time"))
  expect_equal(fb$package, "foobar")

  # cleanup
  vcr::use_cassette("cchn_pkg_rule_add_cleanup", {
    cchn_pkg_rule_delete(fb$id, email = email)
  })
})