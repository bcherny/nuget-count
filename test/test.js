// Generated by CoffeeScript 1.6.3
var get;

get = require('../nuget-count');

exports.nuget = {
  success: function(test) {
    var err, fn;
    test.expect(1);
    fn = function(count) {
      var isMoreThan100;
      isMoreThan100 = count > 100;
      test.equals(isMoreThan100, true);
      return test.done();
    };
    err = function(e) {
      test.ok(false);
      return test.done();
    };
    return (get('microsoft')).then(fn, err);
  },
  error: function(test) {
    var fn;
    test.expect(1);
    fn = function() {
      test.ok(true);
      return test.done();
    };
    return (get('ajkldanjkndjklfndjfnjkdsnfjrnfjkdndjkvnifsdvnfjkvnsrifrifnsermnerjifnerjfnjr')).then((function() {}), fn, (function() {}));
  }
};
