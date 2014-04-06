// Generated by CoffeeScript 1.6.3
(function() {
  this.AuthDialog = (function() {
    function AuthDialog() {}

    AuthDialog.show = function(title) {
      var source;
      source = "";
      source += "<div class='signin-btn-container'>";
      source += "  <a class='zocial googleplus' href='/auth/google'>Sign in with Google</a>";
      source += "  <a class='zocial facebook' href='/auth/facebook'>Sign in with Facebook</a>";
      source += "  <a class='zocial twitter btn disabled' href='/auth/twitter'>Sign in with Twitter (disabled)</a>";
      source += "<div/>";
      return bootbox.dialog({
        message: source,
        title: title
      });
    };

    return AuthDialog;

  })();

  $(document).on('ready page:load', function() {
    return ($('#sign-in')).click(function() {
      return AuthDialog.show('Sign In');
    });
  });

}).call(this);
