// Generated by CoffeeScript 1.6.3
(function() {
  this.Ranking = (function() {
    function Ranking(selector) {
      this.$target = $(selector);
      (this.$target.find('.nav-tabs')).bind('click', this.onTabClicked);
    }

    Ranking.prototype.onTabClicked = function(e) {
      return console.log(e);
    };

    return Ranking;

  })();

}).call(this);
