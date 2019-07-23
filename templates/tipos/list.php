<?php include __DIR__ . '/../layouts/header.php'?>

<div id="content" style="display: none;">
    <h1>Tipos</h1>

    <table id="table" class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Ativo</th>
            <th>Validade</th>
            <!-- <th>Desc.</th>
            <th>Ascendente</th>-->
            <th>Ações</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<div id="tipo-dialog" title="Editar tipo">
    <form>
        <input type="hidden" name="id">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="ID" disabled>
        </div>
        <div class="form-group">
            <label for="name">Nome</label>
            <input type="text" class="form-control" id="nome" name="nome" placeholder="nome" required>
        </div>
        <div class="form-group">
            <label for="ativo">Ativo</label>
            <input type="number" class="form-control" id="ativo" name="ativo" required>
        </div>

        <div class="form-group">
            <label for="possui_validade">Validade</label>
            <input type="text" class="form-control" id="possui_validade" name="possui_validade" required>
        </div>


        <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </form>
</div>

<div id="delete-dialog" title="Exclusão de cliente">
    <p><span class="ui-icon ui-icon-alert"></span>Deseja excluir</p>
</div>
<?php include __DIR__ . '/../layouts/footer.php'?>
<script type="text/javascript">
    //https://sciactive.com/pnotify/
    function showNotificationError(text) {
        new PNotify({
            title: 'Mensagem de erro',
            text: text,
            styling: 'brighttheme',
            type: 'error'
        });
    }

    function showLoading(text){
        new PNotify({
            text: text,
            styling: 'brighttheme',
            type: 'info',
            hide: false,
            addclass: 'stack-modal',
            stack: {
                dir1: 'down',
                dir2: 'right',
                modal: true,
                overlay_close: true
            }
        });
    }
    function listClients() {
        var loading = '<tr><td colspan="6">Carregando...</td></tr>',
            empty = '<tr><td colspan="6">Nenhum registrado encontrado</td></tr>';
        var tbody = $('#table>tbody');
        tbody.html(loading);
        $.get('/api/tipos', function (data) {
            data.length ? tbody.empty() : tbody.html(empty);
            var btnEdit = $('<button/>').attr('type', 'button').html('Editar');
            var btnDelete = $('<button/>').attr('type', 'button').html('Excluir');
            for (var key in data) {
                var tr = $('<tr/>'),
                    row = data[key],
                    id = $('<td/>').html(row.id),
                    nome = $('<td/>').html(row.nome),
                    ativo = $('<td/>').html(row.ativo),
                    possui_validade = $('<td/>').html(row.possui_validade);

                var actions = $('<td/>');
                actions.append(btnEdit.clone())
                    .append(btnDelete.clone());

                tr.data('tipo-id', row.id);

                tr.append(id)
                    .append(nome)
                    .append(ativo)
                    .append(possui_validade)
                    //.append(ascendente)
                    .append(actions);

                tbody.append(tr);
            }
            tbody
                .find('button:contains(Editar)').button({
                icon: 'ui-icon-pencil'
            })
                .click(function () {
                    var button = $(this),
                        tr = button.closest('tr'),
                        id = tr.data('tipo-id');
                    loadEditForm(id);
                });
            tbody
                .find('button:contains(Excluir)').button({
                icon: 'ui-icon-trash'
            })
                .click(function () {
                    var button = $(this),
                        tr = button.closest('tr'),
                        index = tr.index(),
                        id = tr.data('tipo-id');
                    $('#delete-dialog').data('delete_id', id);
                    $('#delete-dialog').data('delete_index', index);

                    dialogDelete.dialog('open');
                })
        }).fail(function () {
            showNotificationError('Não foi possível consultar os clientes');
        });
    }

    function loadEditForm(id) {
        showLoading('Carregando tipo...');
        $.get('/api/tipos?id=' + id, function (data) {
            PNotify.removeAll();
            var tipo = data[0];
            $('input[name=id]').val(tipo.id);
            $('input[name=nome]').val(tipo.nome);
            $('input[name=ativo]').val(tipo.ativo);
            $('input[name=possui_validade]').val(tipo.possui_validade);
            //$('input[name=descricao]').val(tipo.descricao);
            //$('input[name=ascendente]').val(tipo.ascendente);
            dialogSave.dialog('open');
        }).fail(function () {
            PNotify.removeAll();
            setTimeout(function(){
                showNotificationError('Não foi possível carregar');
            },4000);
        });
    }

    function saveClient() {
        var data = $('#tipo-dialog>form').serializeObject(),
            id = $('input[name=id]').val(),
            url;

        //data.cpf = data.cpf.replace(/[^0-9]/g, '');
        //data.phone = data.phone.replace(/[^0-9]/g, '');
        //07/07/2017 -> 2017-07-07
        //data.birthday = data.birthday.split('/').reverse().join('-');

        if (id == "") {
            url = '/api/tipos/store';
            delete data.id;
        } else {
            url = '/api/tipos/update';
        }

        $.post(url, data)
            .done(function () {
                dialogSave.dialog('close');
                listClients();
            })
            .fail(function () {
                showNotificationError(
                    id==""
                        ?'Não foi possível inserir '
                        :'Não foi possível alterar ');
            });
    }

    function deleteClient() {
        var id = $('#delete-dialog').data('delete_id'),
            index = $('#delete-dialog').data('delete_index');
        $.post('/api/tipos/delete', {id: id})
            .done(function () {
                $('#table>tbody tr').eq(index).remove();
                dialogDelete.dialog('close');
            })
            .fail(function () {
                showNotificationError('Não foi possível excluir este ');
            });
    }

    var dialogSave, dialogDelete;
    function init() {
        dialogSave = $('#tipo-dialog')
            .dialog({
                autoOpen: false,
                height: 400,
                width: 400,
                modal: true,
                buttons: {
                    "Criar tipos": saveClient,
                    "Cancelar": function () {
                        //$(this).dialog('close');
                        dialogSave.dialog('close');
                    }
                },
                close: function () {
                    $('#tipo-dialog>form')[0].reset();
                    $('#tipo-dialog>form').find('input[type=hidden]').val("");
                }
            });
        dialogDelete = $('#delete-dialog')
            .dialog({
                autoOpen: false,
                resizable: false,
                height: "auto",
                modal: true,
                buttons: {
                    "OK": deleteClient,
                    "Cancelar": function () {
                        $(this).dialog('close');
                    }
                }
            });
        $('#tipo-dialog>form').on('submit', function (event) {
            event.preventDefault();
            saveClient();
        })
        $('#content>button').button({
            icon: 'ui-icon-plus'
        }).click(function () {
            dialogSave.dialog('open');
        });
        /*$('input[name=cpf]').mask('000.000.000-00');
        var SPMaskBehavior = function (val) {
                return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
            },
            spOptions = {
                onKeyPress: function (val, e, field, options) {
                    field.mask(SPMaskBehavior.apply({}, arguments), options);
                }
            };*/

        //$('input[name=phone]').mask(SPMaskBehavior, spOptions);
        //$('input[name=birthday]').datepicker();
        $('#content').show('slide');
        listClients();
    }
    $(document).ready(function () {
        init();
    })

</script>
<?php include __DIR__ . '/../layouts/end.php'?>
