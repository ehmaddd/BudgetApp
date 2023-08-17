<a name="readme-top"></a>

<div align="center">

  <h1><b>Budget App - RoR Capstone Project</b></h1>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Budget App - RoR Capstone Project <a name="about-project"></a>

The Budget App has the following features :

-----------------------------------------------------------------------------------------------------------------------
**DATABASE SCHEMA**

The database is created according to the given ERD Diagram :

![image](https://github.com/ehmaddd/BudgetApp/assets/54537654/debe02af-e802-46fd-8caa-b91d256c9302)

-----------------------------------------------------------------------------------------------------------------------

**Technical requirements**

- Used Postgres as your database.
- Used devise for authentication.
- Validate all user input to make sure that anyone with bad intentions cannot compromise app.
- Used a view template engine (.erb).
- Deployed the project so that it's accessible online.

-----------------------------------------------------------------------------------------------------------------------

**SPLASH PAGE**
A simple page with the name of your app (yes, you need to choose one), and links to the sign up and log in pages.

**Sign up and log in pages**
- The user should be able to register in the app with full name, email and password (all mandatory).
- The user can log into the app using email and password.
- If the user is not logged in, they can't access pages that require the user to be logged in (all the pages described below).

**Home page (categories page)**
- When the user logs in, they are presented with the categories page.
- For each category, the user can see their name, icon and the total amount of all the transactions that belongs to that category.
- When the user clicks (or taps) on a category item, the application navigates to the transactions page for that category.
- There is a button "add a new category" at the bottom that brings the user to the page to create a new category.

**Transactions page**
- For a given category, the list of transactions is presented, ordered by the most recent.
- At the top of the page the user could see the total amount for the category (sum of all of the amounts of the transactions in that category).
- There is a button "add a new transaction" at the bottom that brings the user to the page to create a new transaction.
   When the user clicks on the "Back" button (<), the user navigates to the home page.

**"Add a new category" page**
- The user fills out a form to create a new category, indicating their name and icon (both mandatory).
- The user clicks (or taps) the "Save" button to create the new category, and is taken to the home page on success.
- When the user clicks on the "Back" button (<), the user navigates to the home page.

**"Add a new transaction" page**
- The user fills out a form to create a new transaction with:
  - name (mandatory)
  - amount (mandatory)
  - categories (selected automatically)
- The user click (or taps) the "Save" button to create the new transaction, and is taken to the transactions page for that category.
- When the user clicks on the "Back" button (<), the user navigates to the transactions page for that category.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li>Ruby</li>
  </ul>
</details>
<details>
  <summary>Data Base</summary>
  <ul>
    <li>Postgresql</li>
  </ul>
</details>
<details>
  <summary>Server</summary>
  <ul>
    <li>Rails</li>
  </ul>
</details>
<!-- Features -->

### Key Features <a name="key-features"></a>

- **[Create new category]**
- **[Add transaction in category]**
- **[Create new users]**
- **[Change password]**

<p align="right"><a href="#readme-top">Back to top</a></p>

## 🚀 Live Demo <a name="live-demo"></a>

### Video Demo Link <a name="live-demo-link"></a>

Comming soon

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

- You'll need any code editor

### Setup

Clone this repository to your desired folder:

```sh
  git@github.com:ehmaddd/BudgetApp.git
  cd BudgetApp
```

### Install

Install this project with:

```sh
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```

### Run tests

To run tests, run the following command:

```sh
  rails db:migrate RAILS_ENV=test
  rspec
```

## 👥 Authors <a name="authors"></a>

🕵🏽‍♀️ **Ahmad Saeed**

- Github: [GitHub](https://github.com/ehmaddd/)
- Twitter: [Twitter](https://twitter.com/ehmaddd_pk)
- Linkedin: [LinkedIn](https://www.linkedin.com/in/ehmaddd/)

<p align="right"><a href="#readme-top">Back to top</a></p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Improve UI design]**
- [ ] **[Create the desktop version]**
- [ ] **[Icon upload mechanism]**

<p align="right"><a href="#readme-top">Back to top</a></p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ehmaddd/BudgetApp/issues).

<p align="right"><a href="#readme-top">Back to top</a></p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project you can give it a star!

<p align="right"><a href="#readme-top">Back to top</a></p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank Microverse community for helping me to improve my skills.
Moreover, the design I followed to create this project is the Original design idea by Gregoire Vella on Behance. I give the due regard and credit to the creator of the design on the successfull completion of my project.

<p align="right"><a href="#readme-top">Back to top</a></p>

<!-- FAQ (optional) -->

## 📝 License <a name="license"></a>

This project is [MIT](https://github.com/ehmaddd/BudgetApp/blob/main/LICENSE) licensed.

<p align="right"><a href="#readme-top">Back to top</a></p>
