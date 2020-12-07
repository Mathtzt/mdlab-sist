<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Anamnese</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"/>
    <link rel="stylesheet" href="./css/application.css">

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment-with-locales.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
    <script src="./js/application.js"></script>
</head>
<body>
    <fieldset class="d-flex">
        <section>
            <div class="wrapper">
                <nav id="sidebar">

                    <div class="sidebar-header">
                        <img src="assets/imgs/logo-anamnese.png">
                        <div class="welcome">
                            <span>Bem vindo(a), </span>
                            <span class="base-color">${sessaoUsuario}</span>
                        </div>
                    </div>
                    <div class="button-logoff">
                        <button type="button" class="btn btn-secondary btn-sm">Sair</button>
                    </div>

                    <div class="sidebar-footer">
                        <img src="assets/imgs/logo-medilab.png">
                    </div>
                </nav>
            </div>
        </section>

        <section>
            <div class="container">
                <section>
                    <h3>Gestão de Pacientes</h3>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a class="breadcrumb-link" href="#">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Gestão de Pacientes</li>
                        </ol>
                    </nav>
                </section>
                <section>
                    <div class="d-flex">
                        <div class="row mt-3 mb-3">
                            <div id="id-datepicker" class="col-sm-3 mb-3">
                                <div class="form-group">
                                    <div class='input-group input-group-sm date' id='datepicker'>
                                        <input id="dtp-id" type="text" class="form-control" name="date" autocomplete="off"
                                               placeholder="Data" onblur="filterByCondition('dtp-id')">
                                        <div class="input-group-append">
                                        <span class="input-group-text prepend-bg">
                                            <img src="assets/imgs/icon-calendar.png" alt="calendar"/>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3 pl-0 mb-3">
                                <div class="input-group input-group-sm">
                                    <select class="custom-select" id="modalitySelect" onblur="filterSelectByCondition('modalitySelect')">
                                        <option value="" selected>Modalidade</option>
                                        <option value="MR">MR</option>
                                        <option value="CT">CT</option>
                                        <option value="CR">CR</option>
                                    </select>
                                    <div class="input-group-append">
                                        <label class="input-group-text prepend-bg" for="modalitySelect">
                                            <i class="fas fa-caret-down prepend-img"></i>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3 pl-0 mb-3">
                                <div class="input-group input-group-sm">
                                    <select class="custom-select" id="filterSelect">
                                        <option value="" selected>Filtro geral</option>
                                        <option value="flt-1">Opção 1</option>
                                        <option value="flt-2">Opção 2</option>
                                        <option value="flt-3">Opção 3</option>
                                    </select>
                                    <div class="input-group-append">
                                        <label class="input-group-text prepend-bg" for="filterSelect">
                                            <i class="fas fa-caret-down prepend-img"></i>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3 pl-0 mb-3">
                                <div class="input-group input-group-sm">
                                    <input id="filterSearch" type="text" class="form-control" placeholder="Procurar" aria-label="Procurar" aria-describedby="search" onblur="searchByCondition('search', 'filterSearch')">
                                    <div id="search-append" class="input-group-append">
                                        <a class="btn btn-search" type="button" id="search" onclick="searchByCondition('search', 'filterSearch')">
                                            <i class="fas fa-search mt-1"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <table id="recordList" class="display tbl-width">
                        <thead>
                        <tr>
                            <th id="th-id">ID Paciente</th>
                            <th id="th-patient">Paciente</th>
                            <th id="th-number">Número</th>
                            <th id="th-exam">Tipo de exame</th>
                            <th id="th-modality">Modalidade</th>
                            <th id="th-date">Data</th>
                            <th id="th-visualization">Visualização</th>
                        </tr>
                        </thead>
                    </table>
                </section>
                <section>
                    <div class="d-flex justify-content-between mt-3">
                        <div>
                            <button type="button" class="btn btn-secondary btn-sm btn-return">Voltar</button>
                        </div>

                        <nav aria-label="Page navigation">
                            <div class="pagination">
                                <div class="page-item">
                                    <button id="btn-previous" class="btn btn-secondary pg-previous" aria-label="Previous" onclick="paginatePrevious()">
                                        <img src="assets/imgs/icon-anterior.png" alt=""/>
                                        <span class="sr-only">Previous</span>
                                    </button>
                                </div>
                                <span id="page-info" class="d-flex align-items-center ml-2 mr-2"></span>
                                <div class="page-item">
                                    <button id="btn-next" class="btn btn-secondary pg-next" aria-label="Next" onclick="paginateNext()">
                                        <img src="assets/imgs/icon-proximo.png" alt=""/>
                                        <span class="sr-only">Next</span>
                                    </button>
                                </div>
                            </div>
                        </nav>
                    </div>
                </section>
            </div>
        </section>
    </fieldset>
</body>
</html>