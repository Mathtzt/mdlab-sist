$(document).ready(function() {
    $('#recordList').DataTable({
        "ajax": {
            url: '/index/list',
            dataSrc: ''
        },
        "columns": [
            { "data": "patientID" },
            { "data": "nome" },
            { "data": "numero" },
            { "data": "tipoExame" },
            { "data": "modalidade" },
            { "data": "data", render: function (data) {
                    const dt = moment(data);
                    return dt.format("DD/MM/YYYY");
            }}
        ],
        "columnDefs": [{
            "targets": [ 6 ],
            "data": "visualization",
            "render": function (data) {
                if (data == null) {
                    return "<a href='#'><span class='base-color'><b>Responder questionário</b></span></a>";
                }
            }
        }],
        "language": {
            "lengthMenu": "",
            "zeroRecords": "Nenhum registro encontrado",
            "info": "",
            "infoEmpty": "-",
            "infoFiltered": "(filtrado de um total de _MAX_ registros)",
            "loadingRecords": "Carregando...",
            "search": "Buscar",
            "pagingType": "full",
            "paginate": {
                "first":      "Primeira",
                "last":       "Última",
                "next":       "Próxima",
                "previous":   "Anterior"
            }
        },
        "paging": true,
        "pageLength": 5,
        "stateSave": true,
        "stateSaveCallback": function (oSettings, oData) {
            localStorage.setItem('DataTables_'+window.location.pathname, JSON.stringify(oData));
            localStorage.setItem('DataTablesSettings_'+window.location.pathname, JSON.stringify(oSettings));
        },
        "stateLoadCallback": function (oSettings, oData) {
            return JSON.parse(localStorage.getItem('DataTables_'+window.location.pathname));
        }
    });
    updatePaginationInfo();
});

function searchByCondition(id, idValue) {
    const table = $('#recordList').DataTable();
    $(`#${id}`).on('click', function () {
        table.search($(`#${idValue}`).val()).draw();
    });

    $(`#${idValue}`).on('blur', function () {
        table.search($(`#${idValue}`).val()).draw();
    });
}

function filterByCondition(id) {
    const table = $('#recordList').DataTable();
    $(`#${id}`).on('blur', function () {
        table.search($(`#${id}`).val()).draw();
    });
}

function filterSelectByCondition(id) {
    const table = $('#recordList').DataTable();
    $(`#${id}`).on('blur', function () {
        table.search($(`#${id} option:selected`).val()).draw();
    });
}

function paginateNext() {
    const table = $('#recordList').DataTable();
    $('#btn-next').on('click', function() {
        table.page('next').draw('page');
        const info = table.page.info();
        info.page++;
        localStorage.setItem('DataTablesPageInfo_'+window.location.pathname, JSON.stringify(info));
        updatePaginationInfo()

    });
}

function paginatePrevious() {
    const table = $('#recordList').DataTable();
    $('#btn-previous').on('click',function() {
        table.page('previous').draw('page')
        const info = table.page.info();
        localStorage.setItem('DataTablesPageInfo_'+window.location.pathname, JSON.stringify(info));
        updatePaginationInfo()

    });
}

function updatePaginationInfo() {
    const info = JSON.parse(localStorage.getItem('DataTablesPageInfo_'+window.location.pathname));
    if(info.page === 0) {
        info.page = 1;
    }
    $('#page-info').text('Página '+(info.page)+' de '+info.pages);
}

/*------Related to datepicker------*/
$(document).ready(function() {
    $('#datepicker').datepicker({
        language: "pt-BR"
    });
});

!function (a) {
    a.fn.datepicker.dates["pt-BR"] = {
        days: ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"],
        daysShort: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"],
        daysMin: ["D", "S", "T", "Q", "Q", "S", "S"],
        months: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
        monthsShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
        today: "Hoje",
        monthsTitle: "Meses",
        clear: "Limpar",
        format: "dd/mm/yyyy"
    }
}(jQuery);