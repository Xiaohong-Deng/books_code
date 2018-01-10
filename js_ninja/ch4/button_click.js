<button id="test">Click Me!</button>
<script type="text/javascript">
  function Button() {
    this.clicked = false;
    this.click = function() {
      this.clicked = true;
      assert(button.clicked, "The button has been clicked");
    };
  }
  var button = new Button();
  var elem = document.getElementById("test");
  // when button.click is invoked, event-handling system of the browser
  // defines the context which is "this" for button.click to be the target
  // element of the event
  elem.addEventListener("click", button.click);
</script>
<button id="retest">Click You!</button>

<script type="text/javascript">
  function Button() {
    this.clicked = false;
    // arrow function does not have its this, "this" in its definition is
    // the same as "this" where it is defined, in this case, "this" inside
    // Button() definition
    this.click = () => {
      this.clicked = true;
      assert(button.clicked, "The button has been clicked");
    };
  }

  var button = new Button();
  var elem = document.getElementById("retest");
  //
  elem.addEventListener("click", button.click);
</script>
