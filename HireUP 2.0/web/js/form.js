const formUserChange = () => {
    let form = document.getElementById('myForm');
    form.action = 'Controller/deleteUsuario.jsp';
    form.method = 'POST';
    form.submit();
};
const formEmpChange = () => {
    let form = document.getElementById('myForm');
    form.action = 'Controller/apagarEmpresa.jsp';
    form.method = 'POST';
    form.submit();
};
