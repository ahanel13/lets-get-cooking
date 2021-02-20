function hello(name) {
    console.log("Hello " + name + "!");
  }

function greet_user(last_name, first_name) {
    hello(last_name + " " + first_name);
  }
  /* Or the ES6 version for this: */
  $(() =>
    $('button#greet-user-button').on('click', () => greet_user('Dire', 'Strait'))
  );