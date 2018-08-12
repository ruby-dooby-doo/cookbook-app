/* global Vue, VueRouter, axios */

// SORT OF like your controller
var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var RecipeNewPage = {
  template: "#recipe-new-page",
  data: function() {
    return {
      title: "",
      ingredients: "",
      directions: "",
      prep_time: "",
      // newRecipe: {title: "", ingredients: "", prep_time: "", directions: ""}
      errors: []
    };
  },
  methods: {
    submit: function() {
      console.log('in the submit function for new recipes')
      var params = {
        input_title: this.title,
        input_ingredients: this.ingredients,
        input_prep_time: this.prep_time,
        input_directions: this.directions
      };
      console.log(params)
      axios
        .post("/api/recipes", params)
        .then(function(response) {
          console.log(response);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            console.log(this.errors);
          }.bind(this)
        );
    }
  }
};



var RandomPage = {
  // SORT OF like a view
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
  // routes.rb/routes file
  routes: [
    { path: "/", component: HomePage },
    { path: "/random", component: RandomPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/recipes/new", component: RecipeNewPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});



var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    console.log('jwt');
    console.log(jwt);
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
