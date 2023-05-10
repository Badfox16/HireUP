function enableCreateUser() {
    if (document.getElementById("is_user").checked) {
      disableForm(false);
    }
    if (!document.getElementById("is_user").checked) {
      disableForm(true);
    }
  
  }
  
  function disableForm(flag) {
    var elements = document.getElementsByClassName("inptEmpresa");
    for (var i = 0, len = elements.length; i < len; ++i) {
      elements[i].readOnly = flag;
      elements[i].disabled = flag;
    }
  }