/* global axios */

console.log('in index.js');

// get the box
// get the thing you want to put in the box
// copy the thing and put it in the box

var recipeTemplate = document.querySelector('#recipe-card');

var recipeContainer = document.querySelector('.row');


recipeContainer.appendChild(recipeTemplate.content.cloneNode(true));

// get data from api
axios.get("/api/recipes").then(function(response) {
  // this is the data from the api
  var recipes = response.data;

  // loop through all the data from the api
  recipes.forEach(function(recipe) {
    // for each recipe in the db...
    console.log(recipe);
    // copy template
    var recipeClone = recipeTemplate.content.cloneNode(true);
    // modify template
    recipeClone.querySelector('.card-title').innerText = recipe.title;
    recipeClone.querySelector('.card-text').innerText = recipe.directions;
    recipeClone.querySelector('.id').innerText = "id: " + recipe.id;
    recipeClone.querySelector('.user').innerText = "user name: " + recipe.user.name;
    recipeClone.querySelector('.prep ').innerText = "prep time: " + recipe.prep_time;

    // add to DOM
    recipeContainer.appendChild(recipeClone);
  });
});

// response = Unirest.get("/api/recipes")
// p response.body

// axios.get("/api/recipes").then(function(response) {
//   console.log('i am on line 43');
//   console.log(response.data);
// });

// console.log('i am after line 43, on line 47');
