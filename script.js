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

  // Renderiza a tabela com dados, células editáveis, e linha de "Adicionar"
  function renderTable() {
    tbody.innerHTML = '';
    sampleData.forEach(data => {
      const tr = document.createElement('tr');
      Object.values(data).forEach(text => {
        const td = document.createElement('td');
        td.textContent = text;
        td.contentEditable = true;
        tr.appendChild(td);
      });
      tbody.appendChild(tr);
    });

    const addTr = document.createElement('tr');
    addTr.classList.add('add-row');
    const addTd = document.createElement('td');
    addTd.colSpan = 5;
    addTd.textContent = '+ Adicionar';
    addTd.addEventListener('click', () => {
      const newTr = document.createElement('tr');
      ['pep','ov','equipment','productLine','status'].forEach(() => {
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