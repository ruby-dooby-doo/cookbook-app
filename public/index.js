/* global Vue, VueRouter, axios */

var RandomPage = {
  template: "#random-page",
  data: function() {
    return {
      message: "Welcome to Vue.js! from the random page hahahah"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      recipes: []
    };
  },
  created: function() {
    console.log('in created function')
    axios.get('/api/recipes').then(function(response) {
      console.log(response.data);
      this.recipes = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/random", component: RandomPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});
