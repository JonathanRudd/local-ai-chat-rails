// import { GptApi } from "/services/gpt_api";

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

  // call the GptApi class in gpt_api.rb, passing to it the items array
  shopkeeper = new GptApi(items);
  shopkeeper.get_response();
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
