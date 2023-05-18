

const addItems = document.querySelector('.add-items');
const itemsList = document.querySelector('.messages');

let items = JSON.parse(localStorage.getItem('items')) || [];


function addItem(e) {
  e.preventDefault();
  const input = document.querySelector('input[name="item"]');
  const text = input.value;

  const item = { "role": "user", "content"  : text }; // create object with text property
  items.push(item); // add item to items array
  populateList(items, itemsList); // update display of list
  localStorage.setItem('items', JSON.stringify(items)); // store updated list in local storage
  this.reset(); // reset form

}

function populateList(messages = [], messagesList) {
  messagesList.innerHTML = messages.map((message, i) => {
    return `
      <li>
        <label for="item${i}">${message.content}</label>
      </li>
    `;
  }).join('');
}

addItems.addEventListener('submit', addItem);

populateList(items, itemsList);

// removed everything from here and put it back as <script> in home.html.erb
// moved it back, that wasn´t the problem!
// maybe it will be easier to pass items to the home.html.erb file from here
// Can I use export and import to pass the items array to the home.html.erb file?
