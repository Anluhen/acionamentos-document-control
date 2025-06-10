// Dados de exemplo
const sampleData = [
    { pep: 'PEP001', ov: 'OV-A1', equipment: 'Máquina X', productLine: 'Linha A', status: 'Pendente' },
    { pep: 'PEP002', ov: 'OV-B2', equipment: 'Equipamento Y', productLine: 'Linha B', status: 'Concluído' }
];

document.addEventListener('DOMContentLoaded', () => {
    const sidebar = document.getElementById('sidebar');
    const toggleBtn = document.getElementById('toggleBtn');
    const menuItems = document.querySelectorAll('#sidebar ul li');
    const pages = document.querySelectorAll('.page');
    const tbody = document.querySelector('#docTable tbody');
    const headerCells = document.querySelectorAll('.th-container');

    // Variáveis para armazenar estado de ordenação e filtros
    let sortOrder = {};
    let filters = {};

    // Alterna colapso/expansão do menu
    toggleBtn.addEventListener('click', () => {
        sidebar.classList.toggle('collapsed');
    });

    // Navegação entre páginas
    menuItems.forEach(item => {
        item.addEventListener('click', () => {
            pages.forEach(p => p.classList.remove('active'));
            document.getElementById(item.dataset.page).classList.add('active');
        });
    });

    // Setup header popup menus
    headerCells.forEach(th => {
        const key = th.dataset.key;
        th.style.position = 'relative';
        sortOrder[key] = 'asc';
        filters[key] = '';

        // create popup
        const popup = document.createElement('div');
        popup.className = 'popup-menu';
        popup.innerHTML = `
      <button data-action="sort-asc">Ordenar Asc</button>
      <button data-action="sort-desc">Ordenar Desc</button>
      <input type="text" placeholder="Filtrar" data-input="filter">
      <button data-action="apply-filter">Aplicar</button>
    `;
        th.appendChild(popup);

        // icon click
        th.querySelector('.menu-icon').addEventListener('click', e => {
            e.stopPropagation();
            closeAllPopups();
            popup.classList.toggle('show');
        });

        // popup actions
        popup.addEventListener('click', e => {
            e.stopPropagation();
            const action = e.target.dataset.action;
            if (action === 'sort-asc' || action === 'sort-desc') {
                sampleData.sort((a, b) => {
                    const valA = a[key].toLowerCase();
                    const valB = b[key].toLowerCase();
                    return action === 'sort-asc' ? valA.localeCompare(valB) : valB.localeCompare(valA);
                });
                sortOrder[key] = action === 'sort-asc' ? 'desc' : 'asc';
                renderTable();
                closeAllPopups();
            }
            if (action === 'apply-filter') {
                const inputVal = popup.querySelector('[data-input="filter"]').value.toLowerCase();
                filters[key] = inputVal;
                renderTable();
                closeAllPopups();
            }
        });
    });

    // close popups on outside click
    document.addEventListener('click', closeAllPopups);
    function closeAllPopups() {
        document.querySelectorAll('.popup-menu.show').forEach(m => m.classList.remove('show'));
    }

    // render with sort & filter
    function renderTable() {
        tbody.innerHTML = '';
        sampleData
            .filter(item => {
                return Object.keys(filters).every(key => {
                    return !filters[key] || item[key].toLowerCase().includes(filters[key]);
                });
            })
            .forEach(data => {
                const tr = document.createElement('tr');
                Object.values(data).forEach(text => {
                    const td = document.createElement('td');
                    td.textContent = text;
                    td.contentEditable = true;
                    tr.appendChild(td);
                });
                tbody.appendChild(tr);
            });

        // add-row
        const addTr = document.createElement('tr');
        addTr.className = 'add-row';
        const addTd = document.createElement('td');
        addTd.colSpan = 5;
        addTd.textContent = '+ Adicionar';
        addTd.addEventListener('click', () => {
            const newTr = document.createElement('tr');
            ['pep', 'ov', 'equipment', 'productLine', 'status'].forEach(() => {
                const td = document.createElement('td');
                td.contentEditable = true;
                td.textContent = '';
                newTr.appendChild(td);
            });
            tbody.insertBefore(newTr, addTr);
            newTr.querySelector('td').focus();
        });
        addTr.appendChild(addTd);
        tbody.appendChild(addTr);
    }

    // Inicializa view
    document.querySelector('[data-page="lista"]').click();
    renderTable();
});