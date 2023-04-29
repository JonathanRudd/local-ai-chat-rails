

const addItems = document.querySelector('.add-items');
const itemsList = document.querySelector('.messages');

const items = JSON.parse(localStorage.getItem('items')) || [];


function addItem(e) {
  e.preventDefault();
  const input = document.querySelector('input[name="item"]');
  const text = input.value;

  const item = { "role": "user", "content"  : text }; // create object with text property
  items.push(item); // add item to items array
  populateList(items, itemsList); // update display of list
  localStorage.setItem('items', JSON.stringify(items)); // store updated list in local storage
  this.reset(); // reset form

  // how do I call the function from here?



  GptApi.fetch_gpt(items); // call fetch_gpt function from gpt_api.rb
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
