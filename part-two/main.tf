# Random pet resource - provides a unique, random string to use as a prefix or suffix for other resources
resource "random_pet" "this" {
  length = 2
}
