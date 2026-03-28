{ lib }:
{
  "lib.strings" = {
    "toUpper converts string to uppercase" = {
      expr = lib.toUpper "hello world";
      expected = "HELLO WORLD";
    };

    "concatStringsSep joins with separator" = {
      expr = lib.concatStringsSep ", " [
        "foo"
        "bar"
        "baz"
      ];
      expected = "foo, bar, baz";
    };
  };

  "lib.lists" = {
    "filter keeps matching elements" = {
      expr = lib.filter (x: x > 2) [
        1
        2
        3
        4
      ];
      expected = [
        3
        4
      ];
    };
  };
}
